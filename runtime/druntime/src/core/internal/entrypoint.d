/**
 This module contains the code for C main and any call(s) to initialize the
 D runtime and call D main.

  Copyright: Copyright Digital Mars 2000 - 2019.
  License: Distributed under the
       $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0).
     (See accompanying file LICENSE)
  Source: $(DRUNTIMESRC core/_internal/_entrypoint.d)
*/
module core.internal.entrypoint;

/**
A template containing C main and any call(s) to initialize druntime and
call D main.  Any module containing a D main function declaration will
cause the compiler to generate a `mixin _d_cmain();` statement to inject
this code into the module.
*/
template _d_cmain()
{
    extern(C)
    {
        int _Dmain(char[][] args);

        version (Windows)
        {
            int _d_wrun_main(int argc, wchar** wargv, void* mainFunc);

            int wmain(int argc, wchar** wargv)
            {
                pragma(LDC_profile_instr, false);
                return _d_wrun_main(argc, wargv, &_Dmain);
            }
        }
        else
        {
            int _d_run_main(int argc, char** argv, void* mainFunc);

            int main(int argc, char** argv)
            {
                pragma(LDC_profile_instr, false);
                return _d_run_main(argc, argv, &_Dmain);
            }

            // Solaris, for unknown reasons, requires both a main() and an _main()
            version (Solaris)
            {
                int _main(int argc, char** argv)
                {
                    pragma(LDC_profile_instr, false);
                    return main(argc, argv);
                }
            }

            version (WASIp2) {
                import core.sys.wasip2.common : wasmExport, witFree;

                extern(C) void __wasm_call_ctors();
                extern(C) void __wasm_call_dtors();
                @wasmExport!("wasi:cli/run@0.2.12#run")
                pragma(mangle, "__wit_export_wasi:cli__run@0.2.12::run")
                uint __export_run() {
                    __druntime__wit_bindgen_component_type__wasi_cli_run_func(); // force link type custom section;
                    __wasm_call_ctors();

                    auto exitCode = main(0, null);

                    __wasm_call_dtors();

                    return exitCode == 0 ? 0 : 1;
                }
            }
        }
    }

    version(WASIp2) {
        pragma(inline, true)
        void __druntime__wit_bindgen_component_type__wasi_cli_run_func() @nogc nothrow pure {
            imported!"ldc.llvmasm".__irEx_pure!(
            "",
            "",
            `!wasm.custom_sections = !{!0}
            !0 = !{!"component-type:wit-bindgen:0.57.1:wasi:cli@0.2.12:exports:druntime", !"`
            ~`\00\61\73\6D\0D\00\01\00\00\19\16\77\69\74\2D\63\6F\6D\70\6F\6E\65\6E\74`
            ~`\2D\65\6E\63\6F\64\69\6E\67\04\00\07\4E\01\41\02\01\41\02\01\42\03\01\6A`
            ~`\00\00\01\40\00\00\00\04\00\03\72\75\6E\01\01\04\00\13\77\61\73\69\3A\63`
            ~`\6C\69\2F\72\75\6E\40\30\2E\32\2E\31\32\05\00\04\00\17\77\61\73\69\3A\63`
            ~`\6C\69\2F\65\78\70\6F\72\74\73\40\30\2E\32\2E\31\32\04\00\0B\0D\01\00\07`
            ~`\65\78\70\6F\72\74\73\03\00\00\00\44\09\70\72\6F\64\75\63\65\72\73\01\0C`
            ~`\70\72\6F\63\65\73\73\65\64\2D\62\79\02\0D\77\69\74\2D\63\6F\6D\70\6F\6E`
            ~`\65\6E\74\07\30\2E\32\34\37\2E\30\0D\77\69\74\2D\62\69\6E\64\67\65\6E\2D`
            ~`\64\06\30\2E\35\37\2E\31"}`,
            void
            );
        }

        enum CRT_DTOR_LIST_SIZE = 32;
        static assert(CRT_DTOR_LIST_SIZE < uint.max);

        struct CrtDtorList
        {
            alias Dtor = extern(C) void function(void*);

           	CrtDtorList* next;
           	Dtor[CRT_DTOR_LIST_SIZE] func;
           	void*[CRT_DTOR_LIST_SIZE] arg;
        }

        __gshared CrtDtorList dtorListInitial;
        __gshared CrtDtorList* dtorListsHead;
        __gshared uint dtorListSlot;

        extern(C) int __cxa_atexit(CrtDtorList.Dtor func, void* arg, void* dso) @nogc nothrow
        {
            import core.stdc.stdlib : calloc;
           	//LOCK(lock);

           	/* Defer initialization of head so it can be in BSS */
           	if (!dtorListsHead) dtorListsHead = &dtorListInitial;

           	/* If the current function list is full, add a new one */
           	if (dtorListSlot == CRT_DTOR_LIST_SIZE) {
          		CrtDtorList* newList = cast(CrtDtorList*)calloc(CrtDtorList.sizeof, 1);
          		if (!newList) {
         			//UNLOCK(lock);
         			return -1;
          		}
          		newList.next = dtorListsHead;
          		dtorListsHead = newList;
          		dtorListSlot = 0;
           	}

           	/* Append function to the list. */
           	dtorListsHead.func[dtorListSlot] = func;
           	dtorListsHead.arg[dtorListSlot] = arg;
           	++dtorListSlot;

           	//UNLOCK(lock);
           	return 0;
        }

        extern(C) void __funcs_on_exit()
        {
           	//LOCK(lock);
           	for (; dtorListsHead; dtorListsHead=dtorListsHead.next, dtorListSlot = CRT_DTOR_LIST_SIZE) while(dtorListSlot-- > 0) {
          		auto func = dtorListsHead.func[dtorListSlot];
          		auto arg = dtorListsHead.arg[dtorListSlot];
          		//UNLOCK(lock);
          		func(arg);
          		//LOCK(lock);
           	}
        }

        extern(C) void __wasm_call_dtors()
        {
       	    __funcs_on_exit();
           	//__stdio_exit();
        }
    }
}

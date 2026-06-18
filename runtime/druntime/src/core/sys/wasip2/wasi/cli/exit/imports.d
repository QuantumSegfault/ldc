/++

+/
module core.sys.wasip2.wasi.cli.exit.imports;

import core.sys.wasip2.common;

public import core.sys.wasip2.wasi.cli.exit.common;


package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++
Exit the current instance and any linked instances.
+/
void exit(in Result!(void, void) status) @nogc nothrow {
  uint _resultPart4;
  if (status.isErr) {
    
    _resultPart4 = 1;
  } else {
    
    _resultPart4 = 0;
  }
  __import_exit(_resultPart4);
}
/// ditto
@wasmImport!("wasi:cli/exit@0.2.12", "exit")
pragma(mangle, "__wit_import_wasi:cli__exit@0.2.12__exit")
private extern(C) void __import_exit(uint) @nogc nothrow;

/++
Exit the current instance and any linked instances, reporting the
specified status code to the host.

The meaning of the code depends on the context, with 0 usually meaning
"success", and other values indicating various types of failure.

This function does not return; the effect is analogous to a trap, but
without the connotation that something bad has happened.
+/
void exitWithCode(ubyte statusCode) @nogc nothrow {
  __import_exitWithCode(cast(uint)(statusCode));
}
/// ditto
@wasmImport!("wasi:cli/exit@0.2.12", "exit-with-code")
pragma(mangle, "__wit_import_wasi:cli__exit@0.2.12__exit_with_code")
private extern(C) void __import_exitWithCode(uint) @nogc nothrow;

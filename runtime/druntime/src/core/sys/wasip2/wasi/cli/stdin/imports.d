/++

+/
module core.sys.wasip2.wasi.cli.stdin.imports;

import core.sys.wasip2.common;

public import core.sys.wasip2.wasi.cli.stdin.common;

static import core.sys.wasip2.wasi.io.streams.imports;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
alias InputStream = core.sys.wasip2.wasi.io.streams.imports.InputStream;

/++

+/
InputStream getStdin() @nogc nothrow {
  auto _ret = __import_getStdin();
  return InputStream(_ret);
}
/// ditto
@wasmImport!("wasi:cli/stdin@0.2.12", "get-stdin")
pragma(mangle, "__wit_import_wasi:cli__stdin@0.2.12__get_stdin")
private extern(C) uint __import_getStdin() @nogc nothrow;

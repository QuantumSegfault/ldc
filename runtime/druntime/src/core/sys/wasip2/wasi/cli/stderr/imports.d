/++

+/
module core.sys.wasip2.wasi.cli.stderr.imports;

import core.sys.wasip2.common;

public import core.sys.wasip2.wasi.cli.stderr.common;

static import core.sys.wasip2.wasi.io.streams.imports;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
alias OutputStream = core.sys.wasip2.wasi.io.streams.imports.OutputStream;

/++

+/
OutputStream getStderr() @nogc nothrow {
  auto _ret = __import_getStderr();
  return OutputStream(_ret);
}
/// ditto
@wasmImport!("wasi:cli/stderr@0.2.12", "get-stderr")
pragma(mangle, "__wit_import_wasi:cli__stderr@0.2.12__get_stderr")
private extern(C) uint __import_getStderr() @nogc nothrow;

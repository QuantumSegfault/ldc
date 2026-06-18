/++

+/
module core.sys.wasip2.wasi.sockets.instance_network.imports;

import core.sys.wasip2.common;

public import core.sys.wasip2.wasi.sockets.instance_network.common;

static import core.sys.wasip2.wasi.sockets.network.imports;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
alias Network = core.sys.wasip2.wasi.sockets.network.imports.Network;

/++

+/
Network instanceNetwork() @nogc nothrow {
  auto _ret = __import_instanceNetwork();
  return Network(_ret);
}
/// ditto
@wasmImport!("wasi:sockets/instance-network@0.2.12", "instance-network")
pragma(mangle, "__wit_import_wasi:sockets__instance_network@0.2.12__instance_network")
private extern(C) uint __import_instanceNetwork() @nogc nothrow;

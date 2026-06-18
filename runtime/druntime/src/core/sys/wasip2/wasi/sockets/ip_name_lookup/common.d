/++

+/
module core.sys.wasip2.wasi.sockets.ip_name_lookup.common;

import core.sys.wasip2.common;

static import core.sys.wasip2.wasi.io.poll.common;
static import core.sys.wasip2.wasi.sockets.network.common;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
alias ErrorCode = core.sys.wasip2.wasi.sockets.network.common.ErrorCode;

/++

+/
alias IpAddress = core.sys.wasip2.wasi.sockets.network.common.IpAddress;

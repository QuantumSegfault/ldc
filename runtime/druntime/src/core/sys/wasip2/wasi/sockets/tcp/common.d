/++

+/
module core.sys.wasip2.wasi.sockets.tcp.common;

import core.sys.wasip2.common;

static import core.sys.wasip2.wasi.io.poll.common;
static import core.sys.wasip2.wasi.io.streams.common;
static import core.sys.wasip2.wasi.clocks.monotonic_clock.common;
static import core.sys.wasip2.wasi.sockets.network.common;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
alias Duration = core.sys.wasip2.wasi.clocks.monotonic_clock.common.Duration;

/++

+/
alias ErrorCode = core.sys.wasip2.wasi.sockets.network.common.ErrorCode;

/++

+/
alias IpSocketAddress = core.sys.wasip2.wasi.sockets.network.common.IpSocketAddress;

/++

+/
alias IpAddressFamily = core.sys.wasip2.wasi.sockets.network.common.IpAddressFamily;

/++

+/
enum ShutdownType : ubyte {
  /++

  +/
  receive,

  /++

  +/
  send,

  /++

  +/
  both,
}
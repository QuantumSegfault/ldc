/++

+/
module core.sys.wasip2.wasi.sockets.udp.common;

import core.sys.wasip2.common;

static import core.sys.wasip2.wasi.io.poll.common;
static import core.sys.wasip2.wasi.sockets.network.common;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

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
struct IncomingDatagram {
  /++

  +/
  WitList!(ubyte) data;

  /++

  +/
  IpSocketAddress remoteAddress;

  void witFree() {
    data.witFree;
  }

  IncomingDatagram witClone() const {
    IncomingDatagram clone = void;
    clone.data = this.data.witClone;
    clone.remoteAddress = this.remoteAddress.witClone;
    return clone;
  }
}

/++

+/
struct OutgoingDatagram {
  /++

  +/
  WitList!(ubyte) data;

  /++

  +/
  Option!(IpSocketAddress) remoteAddress;

  void witFree() {
    data.witFree;
  }

  OutgoingDatagram witClone() const {
    OutgoingDatagram clone = void;
    clone.data = this.data.witClone;
    clone.remoteAddress = this.remoteAddress.witClone;
    return clone;
  }
}

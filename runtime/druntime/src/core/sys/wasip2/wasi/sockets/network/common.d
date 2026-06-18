/++

+/
module core.sys.wasip2.wasi.sockets.network.common;

import core.sys.wasip2.common;

static import core.sys.wasip2.wasi.io.error.common;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
enum ErrorCode : ubyte {
  /++

  +/
  unknown,

  /++

  +/
  accessDenied,

  /++

  +/
  notSupported,

  /++

  +/
  invalidArgument,

  /++

  +/
  outOfMemory,

  /++

  +/
  timeout,

  /++

  +/
  concurrencyConflict,

  /++

  +/
  notInProgress,

  /++

  +/
  wouldBlock,

  /++

  +/
  invalidState,

  /++

  +/
  newSocketLimit,

  /++

  +/
  addressNotBindable,

  /++

  +/
  addressInUse,

  /++

  +/
  remoteUnreachable,

  /++

  +/
  connectionRefused,

  /++

  +/
  connectionReset,

  /++

  +/
  connectionAborted,

  /++

  +/
  datagramTooLarge,

  /++

  +/
  nameUnresolvable,

  /++

  +/
  temporaryResolverFailure,

  /++

  +/
  permanentResolverFailure,
}
/++

+/
enum IpAddressFamily : ubyte {
  /++

  +/
  ipv4,

  /++

  +/
  ipv6,
}
/++

+/
alias Ipv4Address = Tuple!(ubyte, ubyte, ubyte, ubyte);
/++

+/
alias Ipv6Address = Tuple!(ushort, ushort, ushort, ushort, ushort, ushort, ushort, ushort);
/++

+/
struct IpAddress {
  mixin WitVariant!(
    Ipv4Address, // ipv4
    Ipv6Address, // ipv6
  );

public:
  enum Tag : ubyte {
    /++

    +/
    ipv4,

    /++

    +/
    ipv6,
  }
  Tag tag() const @safe @nogc nothrow pure => _tag;

  /++

  +/
  alias ipv4 = _create!(Tag.ipv4);
  /// ditto
  bool isIpv4() const => _tag == Tag.ipv4;
  ///ditto
  alias getIpv4 = _get!(Tag.ipv4);

  /++

  +/
  alias ipv6 = _create!(Tag.ipv6);
  /// ditto
  bool isIpv6() const => _tag == Tag.ipv6;
  ///ditto
  alias getIpv6 = _get!(Tag.ipv6);

  void witFree() {
  }

  IpAddress witClone() const {
    final switch (_tag) {
      case Tag.ipv4: return _create!(Tag.ipv4)(this._get!(Tag.ipv4).witClone); break;
      case Tag.ipv6: return _create!(Tag.ipv6)(this._get!(Tag.ipv6).witClone); break;
    }
  }
}

/++

+/
struct Ipv4SocketAddress {
  /++

  +/
  ushort port;

  /++

  +/
  Ipv4Address address;

  void witFree() {
  }

  Ipv4SocketAddress witClone() const {
    Ipv4SocketAddress clone = void;
    clone.port = this.port.witClone;
    clone.address = this.address.witClone;
    return clone;
  }
}

/++

+/
struct Ipv6SocketAddress {
  /++

  +/
  ushort port;

  /++

  +/
  uint flowInfo;

  /++

  +/
  Ipv6Address address;

  /++

  +/
  uint scopeId;

  void witFree() {
  }

  Ipv6SocketAddress witClone() const {
    Ipv6SocketAddress clone = void;
    clone.port = this.port.witClone;
    clone.flowInfo = this.flowInfo.witClone;
    clone.address = this.address.witClone;
    clone.scopeId = this.scopeId.witClone;
    return clone;
  }
}

/++

+/
struct IpSocketAddress {
  mixin WitVariant!(
    Ipv4SocketAddress, // ipv4
    Ipv6SocketAddress, // ipv6
  );

public:
  enum Tag : ubyte {
    /++

    +/
    ipv4,

    /++

    +/
    ipv6,
  }
  Tag tag() const @safe @nogc nothrow pure => _tag;

  /++

  +/
  alias ipv4 = _create!(Tag.ipv4);
  /// ditto
  bool isIpv4() const => _tag == Tag.ipv4;
  ///ditto
  alias getIpv4 = _get!(Tag.ipv4);

  /++

  +/
  alias ipv6 = _create!(Tag.ipv6);
  /// ditto
  bool isIpv6() const => _tag == Tag.ipv6;
  ///ditto
  alias getIpv6 = _get!(Tag.ipv6);

  void witFree() {
  }

  IpSocketAddress witClone() const {
    final switch (_tag) {
      case Tag.ipv4: return _create!(Tag.ipv4)(this._get!(Tag.ipv4).witClone); break;
      case Tag.ipv6: return _create!(Tag.ipv6)(this._get!(Tag.ipv6).witClone); break;
    }
  }
}

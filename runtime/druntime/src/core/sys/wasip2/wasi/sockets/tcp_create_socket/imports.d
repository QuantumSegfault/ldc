/++

+/
module core.sys.wasip2.wasi.sockets.tcp_create_socket.imports;

import core.sys.wasip2.common;

public import core.sys.wasip2.wasi.sockets.tcp_create_socket.common;

static import core.sys.wasip2.wasi.sockets.network.imports;
static import core.sys.wasip2.wasi.sockets.tcp.imports;

package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
alias Network = core.sys.wasip2.wasi.sockets.network.imports.Network;

/++

+/
alias TcpSocket = core.sys.wasip2.wasi.sockets.tcp.imports.TcpSocket;

/++

+/
Result!(TcpSocket, ErrorCode) createTcpSocket(in IpAddressFamily addressFamily) @nogc nothrow {
  align(4) void[8] _retArea = void;
  __import_createTcpSocket(cast(uint)(addressFamily), _retArea.ptr);
  Result!(TcpSocket, ErrorCode) _result2 = void;
  bool _isErr2 = (cast(uint)(*(cast(ubyte*)(_retArea.ptr + 0)))) != 0;
  if (_isErr2) {
    
    _result2 = Result!(TcpSocket, ErrorCode).err(cast(core.sys.wasip2.wasi.sockets.network.imports.ErrorCode)(cast(uint)(*(cast(ubyte*)(_retArea.ptr + 4)))));
  } else {
    
    _result2 = Result!(TcpSocket, ErrorCode).ok(TcpSocket(*(cast(uint*)(_retArea.ptr + 4))));
  }
  auto _flush3 = _result2;
  return _flush3;
}
/// ditto
@wasmImport!("wasi:sockets/tcp-create-socket@0.2.12", "create-tcp-socket")
pragma(mangle, "__wit_import_wasi:sockets__tcp_create_socket@0.2.12__create_tcp_socket")
private extern(C) void __import_createTcpSocket(uint, void*) @nogc nothrow;

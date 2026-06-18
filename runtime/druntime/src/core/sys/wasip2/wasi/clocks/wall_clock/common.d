/++

+/
module core.sys.wasip2.wasi.clocks.wall_clock.common;

import core.sys.wasip2.common;


package (core.sys.wasip2) void __wit_bindgen_component_type_force_link() pure @nogc nothrow => imported!"core.sys.wasip2.wasi.cli.imports".__wit_bindgen_component_type_force_link();

/++

+/
struct Datetime {
  /++

  +/
  ulong seconds;

  /++

  +/
  uint nanoseconds;

  void witFree() {
  }

  Datetime witClone() const {
    Datetime clone = void;
    clone.seconds = this.seconds.witClone;
    clone.nanoseconds = this.nanoseconds.witClone;
    return clone;
  }
}

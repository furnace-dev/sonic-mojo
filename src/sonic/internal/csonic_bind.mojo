from memory import UnsafePointer
from sys.ffi import _Global
from .csonic import SonicContext

alias _SONIC_GLOBAL = _Global["SONIC", SonicContext, _init_sonic_global]


fn _init_sonic_global() -> SonicContext:
    return SonicContext()


fn get_sonic_context() -> Pointer[SonicContext, StaticConstantOrigin]:
    var global_ptr: UnsafePointer[SonicContext] = _SONIC_GLOBAL.get_or_create_ptr()

    return Pointer[SonicContext, StaticConstantOrigin](to=global_ptr[])


struct Sonic:
    var _impl: Pointer[SonicContext, StaticConstantOrigin]

    fn __init__(out self):
        self._impl = get_sonic_context()

    fn __copyinit__(out self, existing: Self):
        self._impl = existing._impl

    @always_inline
    fn csonic(self) -> ref [StaticConstantOrigin] SonicContext:
        return self._impl[]

    @always_inline
    fn _csonic_ptr(self) -> Pointer[SonicContext, StaticConstantOrigin]:
        return self._impl

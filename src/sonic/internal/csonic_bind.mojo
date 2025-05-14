from memory import UnsafePointer
from sys.ffi import _Global
from .csonic import CSonic

alias _SONIC_GLOBAL = _Global["SONIC", CSonic, _init_sonic_global]


fn _init_sonic_global() -> CSonic:
    return CSonic()


fn get_sonic_context() -> Pointer[CSonic, StaticConstantOrigin]:
    var global_ptr: UnsafePointer[CSonic] = _SONIC_GLOBAL.get_or_create_ptr()

    return Pointer[CSonic, StaticConstantOrigin](to=global_ptr[])


struct Sonic:
    var _impl: Pointer[CSonic, StaticConstantOrigin]

    fn __init__(out self):
        self._impl = get_sonic_context()

    fn __copyinit__(out self, existing: Self):
        self._impl = existing._impl

    @always_inline
    fn csonic(self) -> ref [StaticConstantOrigin] CSonic:
        return self._impl[]

    @always_inline
    fn _csonic_ptr(self) -> Pointer[CSonic, StaticConstantOrigin]:
        return self._impl

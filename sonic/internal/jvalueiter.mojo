
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *


from .jvalueiter_d import *



alias fn_jvalueiter_destroy = fn (self: UnsafePointer[JValueIter]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvalueiter_destroy: fn_jvalueiter_destroy

    fn __init__(inout self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvalueiter_destroy = self._handle.get_function[fn_jvalueiter_destroy]("JValueIter_destroy")


@always_inline
fn jvalueiter_destroy(self: UnsafePointer[JValueIter]) -> None:
    return __wrapper._jvalueiter_destroy(self)

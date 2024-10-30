
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *


from .jvaluemut_d import *



alias fn_jvaluemut_destroy = fn (self: UnsafePointer[JValueMut]) -> None

var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    var _jvaluemut_destroy: fn_jvaluemut_destroy

    fn __init__(inout self):
        self._handle = DLHandle(LIBNAME)
        
        self._jvaluemut_destroy = self._handle.get_function[fn_jvaluemut_destroy]("JValueMut_destroy")


@always_inline
fn jvaluemut_destroy(self: UnsafePointer[JValueMut]) -> None:
    return __wrapper._jvaluemut_destroy(self)


from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *


from .jsontype_d import *





var __wrapper = _DLWrapper()

@value
struct _DLWrapper:
    var _handle: DLHandle
    
    

    fn __init__(inout self):
        self._handle = DLHandle(LIBNAME)
        
        




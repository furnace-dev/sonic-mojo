from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvalueref_d import *

from .jvalueiter_d import *


alias fn_jvalueiter_len = fn (self: UnsafePointer[JValueIter]) -> c_size_t

alias fn_jvalueiter_next = fn (
    self: UnsafePointer[JValueIter]
) -> UnsafePointer[JValueRef]

alias fn_jvalueiter_destroy = fn (self: UnsafePointer[JValueIter]) -> None

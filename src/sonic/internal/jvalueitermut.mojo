from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvaluemut_d import *

from .jvalueitermut_d import *


alias fn_jvalueitermut_len = fn (self: UnsafePointer[JValueIterMut]) -> c_size_t

alias fn_jvalueitermut_next = fn (
    self: UnsafePointer[JValueIterMut]
) -> UnsafePointer[JValueMut]

alias fn_jvalueitermut_destroy = fn (self: UnsafePointer[JValueIterMut]) -> None

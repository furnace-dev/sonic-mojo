from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jkeyvalueref_d import *

from .jobjectiter_d import *


alias fn_jobjectiter_next = fn (
    self: UnsafePointer[JObjectIter]
) -> UnsafePointer[JKeyValueRef]

alias fn_jobjectiter_destroy = fn (self: UnsafePointer[JObjectIter]) -> None

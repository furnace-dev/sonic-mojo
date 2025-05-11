from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jkeyvaluemut_d import *

from .jobjectitermut_d import *


alias fn_jobjectitermut_next = fn (
    self: UnsafePointer[JObjectIterMut]
) -> UnsafePointer[JKeyValueMut]

alias fn_jobjectitermut_destroy = fn (
    self: UnsafePointer[JObjectIterMut]
) -> None

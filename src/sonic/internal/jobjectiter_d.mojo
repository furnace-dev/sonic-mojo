
from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *



@fieldwise_init
@register_passable("trivial")
struct JObjectIter(Copyable, Movable):
    pass

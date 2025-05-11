from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarrayref_d import *
from .jkeysiter_d import *
from .jobject_d import *
from .jobjectiter_d import *
from .jvalue_d import *
from .jvalueref_d import *

from .jobjectref_d import *


alias fn_jobjectref_clone = fn (
    self: UnsafePointer[JObjectRef]
) -> UnsafePointer[JObject]

alias fn_jobjectref_to_string = fn (
    self: UnsafePointer[JObjectRef], write: UnsafePointer[DiplomatWrite]
) -> None

alias fn_jobjectref_capacity = fn (self: UnsafePointer[JObjectRef]) -> c_size_t

alias fn_jobjectref_contains_key = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> c_bool

alias fn_jobjectref_len = fn (self: UnsafePointer[JObjectRef]) -> c_size_t

alias fn_jobjectref_is_empty = fn (self: UnsafePointer[JObjectRef]) -> c_bool

alias fn_jobjectref_get_value = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> UnsafePointer[JValue]

alias fn_jobjectref_get_value_ref = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> UnsafePointer[JValueRef]

alias fn_jobjectref_get_object_ref = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> UnsafePointer[JObjectRef]

alias fn_jobjectref_get_array_ref = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> UnsafePointer[JArrayRef]

alias fn_jobjectref_get_bool = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView, default: c_bool
) -> c_bool

alias fn_jobjectref_get_i64 = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> OptionI64Result

alias fn_jobjectref_get_u64 = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> OptionU64Result

alias fn_jobjectref_get_f64 = fn (
    self: UnsafePointer[JObjectRef], key: DiplomatStringView
) -> OptionF64Result

alias fn_jobjectref_get_str = fn (
    self: UnsafePointer[JObjectRef],
    key: DiplomatStringView,
    default: DiplomatStringView,
    write: UnsafePointer[DiplomatWrite],
) -> None

alias fn_jobjectref_keys_iter = fn (
    self: UnsafePointer[JObjectRef]
) -> UnsafePointer[JKeysIter]

alias fn_jobjectref_iter = fn (
    self: UnsafePointer[JObjectRef]
) -> UnsafePointer[JObjectIter]

alias fn_jobjectref_destroy = fn (self: UnsafePointer[JObjectRef]) -> None

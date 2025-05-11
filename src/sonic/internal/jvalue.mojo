from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarraymut_d import *
from .jobject_d import *
from .jobjectmut_d import *
from .jsontype_d import *

from .jvalue_d import *


alias fn_jvalue_new = fn () -> UnsafePointer[JValue]

alias fn_jvalue_new_bool = fn (value: c_bool) -> UnsafePointer[JValue]

alias fn_jvalue_new_i64 = fn (value: c_int64) -> UnsafePointer[JValue]

alias fn_jvalue_new_u64 = fn (value: c_uint64) -> UnsafePointer[JValue]

alias fn_jvalue_new_f64 = fn (value: c_double) -> UnsafePointer[JValue]

alias fn_jvalue_new_str = fn (value: DiplomatStringView) -> UnsafePointer[
    JValue
]

alias fn_jvalue_from_str = fn (s: DiplomatStringView) -> UnsafePointer[JValue]

alias fn_jvalue_clone = fn (self: UnsafePointer[JValue]) -> UnsafePointer[
    JValue
]

alias fn_jvalue_get_type = fn (self: UnsafePointer[JValue]) -> JsonType

alias fn_jvalue_is_boolean = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_true = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_false = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_null = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_number = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_str = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_array = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_object = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_f64 = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_i64 = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_is_u64 = fn (self: UnsafePointer[JValue]) -> c_bool

alias fn_jvalue_as_bool = fn (self: UnsafePointer[JValue]) -> OptionBoolResult

alias fn_jvalue_as_i64 = fn (self: UnsafePointer[JValue]) -> OptionI64Result

alias fn_jvalue_as_u64 = fn (self: UnsafePointer[JValue]) -> OptionU64Result

alias fn_jvalue_as_f64 = fn (self: UnsafePointer[JValue]) -> OptionF64Result

alias fn_jvalue_as_str = fn (
    self: UnsafePointer[JValue],
    default: DiplomatStringView,
    write: UnsafePointer[DiplomatWrite],
) -> None

alias fn_jvalue_as_object = fn (self: UnsafePointer[JValue]) -> UnsafePointer[
    JObject
]

alias fn_jvalue_as_object_mut = fn (
    self: UnsafePointer[JValue]
) -> UnsafePointer[JObjectMut]

alias fn_jvalue_as_array = fn (self: UnsafePointer[JValue]) -> UnsafePointer[
    JArray
]

alias fn_jvalue_as_array_mut = fn (
    self: UnsafePointer[JValue]
) -> UnsafePointer[JArrayMut]

alias fn_jvalue_to_string = fn (
    self: UnsafePointer[JValue], write: UnsafePointer[DiplomatWrite]
) -> None

alias fn_jvalue_destroy = fn (self: UnsafePointer[JValue]) -> None

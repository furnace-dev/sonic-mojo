from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarrayref_d import *
from .jobject_d import *
from .jobjectref_d import *
from .jsontype_d import *
from .jvalue_d import *

from .jvalueref_d import *


alias fn_jvalueref_clone = fn (self: UnsafePointer[JValueRef]) -> UnsafePointer[
    JValue
]

alias fn_jvalueref_get_type = fn (self: UnsafePointer[JValueRef]) -> JsonType

alias fn_jvalueref_is_true = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_false = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_i64 = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_u64 = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_f64 = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_str = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_object = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_is_array = fn (self: UnsafePointer[JValueRef]) -> c_bool

alias fn_jvalueref_as_bool = fn (
    self: UnsafePointer[JValueRef]
) -> OptionBoolResult

alias fn_jvalueref_as_i64 = fn (
    self: UnsafePointer[JValueRef]
) -> OptionI64Result

alias fn_jvalueref_as_u64 = fn (
    self: UnsafePointer[JValueRef]
) -> OptionU64Result

alias fn_jvalueref_as_f64 = fn (
    self: UnsafePointer[JValueRef]
) -> OptionF64Result

alias fn_jvalueref_as_str = fn (
    self: UnsafePointer[JValueRef],
    default: DiplomatStringView,
    write: UnsafePointer[DiplomatWrite],
) -> None

alias fn_jvalueref_as_object = fn (
    self: UnsafePointer[JValueRef]
) -> UnsafePointer[JObject]

alias fn_jvalueref_as_object_ref = fn (
    self: UnsafePointer[JValueRef]
) -> UnsafePointer[JObjectRef]

alias fn_jvalueref_as_array = fn (
    self: UnsafePointer[JValueRef]
) -> UnsafePointer[JArray]

alias fn_jvalueref_as_array_ref = fn (
    self: UnsafePointer[JValueRef]
) -> UnsafePointer[JArrayRef]

alias fn_jvalueref_to_string = fn (
    self: UnsafePointer[JValueRef], write: UnsafePointer[DiplomatWrite]
) -> None

alias fn_jvalueref_destroy = fn (self: UnsafePointer[JValueRef]) -> None

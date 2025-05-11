from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarraymut_d import *
from .jkeysiter_d import *
from .jobject_d import *
from .jobjectiter_d import *
from .jvalue_d import *
from .jvaluemut_d import *
from .jvalueref_d import *

from .jobjectmut_d import *


alias fn_jobjectmut_clone = fn (
    self: UnsafePointer[JObjectMut]
) -> UnsafePointer[JObject]

alias fn_jobjectmut_to_string = fn (
    self: UnsafePointer[JObjectMut], write: UnsafePointer[DiplomatWrite]
) -> None

alias fn_jobjectmut_clear = fn (self: UnsafePointer[JObjectMut]) -> None

alias fn_jobjectmut_capacity = fn (self: UnsafePointer[JObjectMut]) -> c_size_t

alias fn_jobjectmut_contains_key = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> c_bool

alias fn_jobjectmut_insert_null = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> None

alias fn_jobjectmut_insert_bool = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_bool
) -> None

alias fn_jobjectmut_insert_i64 = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_int64
) -> None

alias fn_jobjectmut_insert_u64 = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_uint64
) -> None

alias fn_jobjectmut_insert_f64 = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView, value: c_double
) -> None

alias fn_jobjectmut_insert_str = fn (
    self: UnsafePointer[JObjectMut],
    key: DiplomatStringView,
    value: DiplomatStringView,
) -> None

alias fn_jobjectmut_insert_value = fn (
    self: UnsafePointer[JObjectMut],
    key: DiplomatStringView,
    value: UnsafePointer[JValue],
) -> None

alias fn_jobjectmut_insert_object = fn (
    self: UnsafePointer[JObjectMut],
    key: DiplomatStringView,
    value: UnsafePointer[JObject],
) -> None

alias fn_jobjectmut_insert_array = fn (
    self: UnsafePointer[JObjectMut],
    key: DiplomatStringView,
    value: UnsafePointer[JArray],
) -> None

alias fn_jobjectmut_remove = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> c_bool

alias fn_jobjectmut_len = fn (self: UnsafePointer[JObjectMut]) -> c_size_t

alias fn_jobjectmut_is_empty = fn (self: UnsafePointer[JObjectMut]) -> c_bool

alias fn_jobjectmut_get_value = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> UnsafePointer[JValue]

alias fn_jobjectmut_get_value_ref = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> UnsafePointer[JValueRef]

alias fn_jobjectmut_get_value_mut = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> UnsafePointer[JValueMut]

alias fn_jobjectmut_get_object_mut = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> UnsafePointer[JObjectMut]

alias fn_jobjectmut_get_array_mut = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> UnsafePointer[JArrayMut]

alias fn_jobjectmut_get_bool = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView, default: c_bool
) -> c_bool

alias fn_jobjectmut_get_i64 = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> OptionI64Result

alias fn_jobjectmut_get_u64 = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> OptionU64Result

alias fn_jobjectmut_get_f64 = fn (
    self: UnsafePointer[JObjectMut], key: DiplomatStringView
) -> OptionF64Result

alias fn_jobjectmut_get_str = fn (
    self: UnsafePointer[JObjectMut],
    key: DiplomatStringView,
    default: DiplomatStringView,
    write: UnsafePointer[DiplomatWrite],
) -> None

alias fn_jobjectmut_keys_iter = fn (
    self: UnsafePointer[JObjectMut]
) -> UnsafePointer[JKeysIter]

alias fn_jobjectmut_iter = fn (
    self: UnsafePointer[JObjectMut]
) -> UnsafePointer[JObjectIter]

alias fn_jobjectmut_destroy = fn (self: UnsafePointer[JObjectMut]) -> None

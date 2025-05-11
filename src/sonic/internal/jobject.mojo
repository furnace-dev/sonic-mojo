from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jarray_d import *
from .jarraymut_d import *
from .jarrayref_d import *
from .jkeysiter_d import *
from .jobjectiter_d import *
from .jobjectitermut_d import *
from .jobjectmut_d import *
from .jobjectref_d import *
from .jvalue_d import *
from .jvaluemut_d import *
from .jvalueref_d import *

from .jobject_d import *


alias fn_jobject_new = fn () -> UnsafePointer[JObject]

alias fn_jobject_with_capacity = fn (capacity: c_size_t) -> UnsafePointer[
    JObject
]

alias fn_jobject_from_str = fn (s: DiplomatStringView) -> UnsafePointer[JObject]

alias fn_jobject_clone = fn (self: UnsafePointer[JObject]) -> UnsafePointer[
    JObject
]

alias fn_jobject_to_string = fn (
    self: UnsafePointer[JObject], write: UnsafePointer[DiplomatWrite]
) -> None

alias fn_jobject_clear = fn (self: UnsafePointer[JObject]) -> None

alias fn_jobject_capacity = fn (self: UnsafePointer[JObject]) -> c_size_t

alias fn_jobject_contains_key = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> c_bool

alias fn_jobject_insert_null = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> None

alias fn_jobject_insert_bool = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView, value: c_bool
) -> None

alias fn_jobject_insert_i64 = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView, value: c_int64
) -> None

alias fn_jobject_insert_u64 = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView, value: c_uint64
) -> None

alias fn_jobject_insert_f64 = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView, value: c_double
) -> None

alias fn_jobject_insert_str = fn (
    self: UnsafePointer[JObject],
    key: DiplomatStringView,
    value: DiplomatStringView,
) -> None

alias fn_jobject_insert_value = fn (
    self: UnsafePointer[JObject],
    key: DiplomatStringView,
    value: UnsafePointer[JValue],
) -> None

alias fn_jobject_insert_object = fn (
    self: UnsafePointer[JObject],
    key: DiplomatStringView,
    value: UnsafePointer[JObject],
) -> None

alias fn_jobject_insert_array = fn (
    self: UnsafePointer[JObject],
    key: DiplomatStringView,
    value: UnsafePointer[JArray],
) -> None

alias fn_jobject_remove = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> c_bool

alias fn_jobject_len = fn (self: UnsafePointer[JObject]) -> c_size_t

alias fn_jobject_is_empty = fn (self: UnsafePointer[JObject]) -> c_bool

alias fn_jobject_get_value = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JValue]

alias fn_jobject_get_value_ref = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JValueRef]

alias fn_jobject_get_object_ref = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JObjectRef]

alias fn_jobject_get_array_ref = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JArrayRef]

alias fn_jobject_get_value_mut = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JValueMut]

alias fn_jobject_get_object_mut = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JObjectMut]

alias fn_jobject_get_array_mut = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> UnsafePointer[JArrayMut]

alias fn_jobject_get_bool = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView, default: c_bool
) -> c_bool

alias fn_jobject_get_i64 = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> OptionI64Result

alias fn_jobject_get_u64 = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> OptionU64Result

alias fn_jobject_get_f64 = fn (
    self: UnsafePointer[JObject], key: DiplomatStringView
) -> OptionF64Result

alias fn_jobject_get_str = fn (
    self: UnsafePointer[JObject],
    key: DiplomatStringView,
    default: DiplomatStringView,
    write: UnsafePointer[DiplomatWrite],
) -> None

alias fn_jobject_keys_iter = fn (self: UnsafePointer[JObject]) -> UnsafePointer[
    JKeysIter
]

alias fn_jobject_iter = fn (self: UnsafePointer[JObject]) -> UnsafePointer[
    JObjectIter
]

alias fn_jobject_iter_mut = fn (self: UnsafePointer[JObject]) -> UnsafePointer[
    JObjectIterMut
]

alias fn_jobject_destroy = fn (self: UnsafePointer[JObject]) -> None

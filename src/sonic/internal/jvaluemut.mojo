from memory import UnsafePointer
from sys.ffi import DLHandle
from .diplomat_runtime import *

from .jvalue_d import *
from .jvalue import *
from .jvalueref_d import *
from .jvalueref import *
from .jvaluemut_d import *
from .jvaluemut import *
from .jsontype_d import *
from .jsontype import *
from .jobject_d import *
from .jobject import *
from .jarray_d import *
from .jarray import *
from .jarraymut_d import *
from .jarraymut import *
from .jarrayref_d import *
from .jarrayref import *
from .jobjectmut_d import *
from .jobjectmut import *
from .jobjectref_d import *
from .jobjectref import *
from .jkeysiter_d import *
from .jkeysiter import *
from .jobjectiter_d import *
from .jobjectiter import *
from .jobjectitermut_d import *
from .jobjectitermut import *
from .jvalueiter_d import *
from .jvalueiter import *
from .jvalueitermut_d import *
from .jvalueitermut import *
from .jkeyvalueref_d import *
from .jkeyvalueref import *


alias fn_jvaluemut_clone = fn (self: UnsafePointer[JValueMut]) -> UnsafePointer[
    JValue
]

alias fn_jvaluemut_get_type = fn (self: UnsafePointer[JValueMut]) -> JsonType

alias fn_jvaluemut_is_boolean = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_true = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_false = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_null = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_number = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_str = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_array = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_object = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_f64 = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_i64 = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_is_u64 = fn (self: UnsafePointer[JValueMut]) -> c_bool

alias fn_jvaluemut_as_bool = fn (
    self: UnsafePointer[JValueMut]
) -> OptionBoolResult

alias fn_jvaluemut_as_i64 = fn (
    self: UnsafePointer[JValueMut]
) -> OptionI64Result

alias fn_jvaluemut_as_u64 = fn (
    self: UnsafePointer[JValueMut]
) -> OptionU64Result

alias fn_jvaluemut_as_f64 = fn (
    self: UnsafePointer[JValueMut]
) -> OptionF64Result

alias fn_jvaluemut_as_str = fn (
    self: UnsafePointer[JValueMut],
    default: DiplomatStringView,
    write: UnsafePointer[DiplomatWrite],
) -> None

alias fn_jvaluemut_as_object_mut = fn (
    self: UnsafePointer[JValueMut]
) -> UnsafePointer[JObjectMut]

alias fn_jvaluemut_as_array_mut = fn (
    self: UnsafePointer[JValueMut]
) -> UnsafePointer[JArrayMut]

alias fn_jvaluemut_to_string = fn (
    self: UnsafePointer[JValueMut], write: UnsafePointer[DiplomatWrite]
) -> None

alias fn_jvaluemut_destroy = fn (self: UnsafePointer[JValueMut]) -> None

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
from .jkeyvaluemut_d import *
from .jkeyvaluemut import *
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


@value
struct CSonic:
    var _handle: DLHandle

    var _diplomat_simple_write: fn_diplomat_simple_write

    var _diplomat_buffer_write_create: fn_diplomat_buffer_write_create

    var _diplomat_buffer_write_get_bytes: fn_diplomat_buffer_write_get_bytes

    var _diplomat_buffer_write_len: fn_diplomat_buffer_write_len

    var _diplomat_buffer_write_destroy: fn_diplomat_buffer_write_destroy

    var _jarray_new: fn_jarray_new

    var _jarray_from_str: fn_jarray_from_str

    var _jarray_with_capacity: fn_jarray_with_capacity

    var _jarray_clone: fn_jarray_clone

    var _jarray_to_string: fn_jarray_to_string

    var _jarray_push_null: fn_jarray_push_null

    var _jarray_push_bool: fn_jarray_push_bool

    var _jarray_push_i64: fn_jarray_push_i64

    var _jarray_push_u64: fn_jarray_push_u64

    var _jarray_push_f64: fn_jarray_push_f64

    var _jarray_push_str: fn_jarray_push_str

    var _jarray_push_value: fn_jarray_push_value

    var _jarray_push_object: fn_jarray_push_object

    var _jarray_push_array: fn_jarray_push_array

    var _jarray_insert: fn_jarray_insert

    var _jarray_pop: fn_jarray_pop

    var _jarray_len: fn_jarray_len

    var _jarray_is_empty: fn_jarray_is_empty

    var _jarray_clear: fn_jarray_clear

    var _jarray_remove: fn_jarray_remove

    var _jarray_get: fn_jarray_get

    var _jarray_get_mut: fn_jarray_get_mut

    var _jarray_iter: fn_jarray_iter

    var _jarray_destroy: fn_jarray_destroy

    var _jarraymut_clone: fn_jarraymut_clone

    var _jarraymut_to_string: fn_jarraymut_to_string

    var _jarraymut_push_null: fn_jarraymut_push_null

    var _jarraymut_push_bool: fn_jarraymut_push_bool

    var _jarraymut_push_i64: fn_jarraymut_push_i64

    var _jarraymut_push_u64: fn_jarraymut_push_u64

    var _jarraymut_push_f64: fn_jarraymut_push_f64

    var _jarraymut_push_str: fn_jarraymut_push_str

    var _jarraymut_push_value: fn_jarraymut_push_value

    var _jarraymut_push_object: fn_jarraymut_push_object

    var _jarraymut_push_array: fn_jarraymut_push_array

    var _jarraymut_insert: fn_jarraymut_insert

    var _jarraymut_pop: fn_jarraymut_pop

    var _jarraymut_len: fn_jarraymut_len

    var _jarraymut_is_empty: fn_jarraymut_is_empty

    var _jarraymut_clear: fn_jarraymut_clear

    var _jarraymut_remove: fn_jarraymut_remove

    var _jarraymut_get: fn_jarraymut_get

    var _jarraymut_get_mut: fn_jarraymut_get_mut

    var _jarraymut_iter: fn_jarraymut_iter

    var _jarraymut_iter_mut: fn_jarraymut_iter_mut

    var _jarraymut_destroy: fn_jarraymut_destroy

    var _jarrayref_clone: fn_jarrayref_clone

    var _jarrayref_to_string: fn_jarrayref_to_string

    var _jarrayref_len: fn_jarrayref_len

    var _jarrayref_is_empty: fn_jarrayref_is_empty

    var _jarrayref_get: fn_jarrayref_get

    var _jarrayref_iter: fn_jarrayref_iter

    var _jarrayref_destroy: fn_jarrayref_destroy

    var _jkeysiter_next: fn_jkeysiter_next

    var _jkeysiter_len: fn_jkeysiter_len

    var _jkeysiter_get: fn_jkeysiter_get

    var _jkeysiter_destroy: fn_jkeysiter_destroy

    var _jkeyvaluemut_get_key: fn_jkeyvaluemut_get_key

    var _jkeyvaluemut_get_value_mut: fn_jkeyvaluemut_get_value_mut

    var _jkeyvaluemut_destroy: fn_jkeyvaluemut_destroy

    var _jkeyvalueref_get_key: fn_jkeyvalueref_get_key

    var _jkeyvalueref_get_value: fn_jkeyvalueref_get_value

    var _jkeyvalueref_destroy: fn_jkeyvalueref_destroy

    var _jobject_new: fn_jobject_new

    var _jobject_with_capacity: fn_jobject_with_capacity

    var _jobject_from_str: fn_jobject_from_str

    var _jobject_clone: fn_jobject_clone

    var _jobject_to_string: fn_jobject_to_string

    var _jobject_clear: fn_jobject_clear

    var _jobject_capacity: fn_jobject_capacity

    var _jobject_contains_key: fn_jobject_contains_key

    var _jobject_insert_null: fn_jobject_insert_null

    var _jobject_insert_bool: fn_jobject_insert_bool

    var _jobject_insert_i64: fn_jobject_insert_i64

    var _jobject_insert_u64: fn_jobject_insert_u64

    var _jobject_insert_f64: fn_jobject_insert_f64

    var _jobject_insert_str: fn_jobject_insert_str

    var _jobject_insert_value: fn_jobject_insert_value

    var _jobject_insert_object: fn_jobject_insert_object

    var _jobject_insert_array: fn_jobject_insert_array

    var _jobject_remove: fn_jobject_remove

    var _jobject_len: fn_jobject_len

    var _jobject_is_empty: fn_jobject_is_empty

    var _jobject_get_value: fn_jobject_get_value

    var _jobject_get_value_ref: fn_jobject_get_value_ref

    var _jobject_get_object_ref: fn_jobject_get_object_ref

    var _jobject_get_array_ref: fn_jobject_get_array_ref

    var _jobject_get_value_mut: fn_jobject_get_value_mut

    var _jobject_get_object_mut: fn_jobject_get_object_mut

    var _jobject_get_array_mut: fn_jobject_get_array_mut

    var _jobject_get_bool: fn_jobject_get_bool

    var _jobject_get_i64: fn_jobject_get_i64

    var _jobject_get_u64: fn_jobject_get_u64

    var _jobject_get_f64: fn_jobject_get_f64

    var _jobject_get_str: fn_jobject_get_str

    var _jobject_keys_iter: fn_jobject_keys_iter

    var _jobject_iter: fn_jobject_iter

    var _jobject_iter_mut: fn_jobject_iter_mut

    var _jobject_destroy: fn_jobject_destroy

    var _jobjectiter_next: fn_jobjectiter_next

    var _jobjectiter_destroy: fn_jobjectiter_destroy

    var _jobjectitermut_next: fn_jobjectitermut_next

    var _jobjectitermut_destroy: fn_jobjectitermut_destroy

    var _jobjectmut_clone: fn_jobjectmut_clone

    var _jobjectmut_to_string: fn_jobjectmut_to_string

    var _jobjectmut_clear: fn_jobjectmut_clear

    var _jobjectmut_capacity: fn_jobjectmut_capacity

    var _jobjectmut_contains_key: fn_jobjectmut_contains_key

    var _jobjectmut_insert_null: fn_jobjectmut_insert_null

    var _jobjectmut_insert_bool: fn_jobjectmut_insert_bool

    var _jobjectmut_insert_i64: fn_jobjectmut_insert_i64

    var _jobjectmut_insert_u64: fn_jobjectmut_insert_u64

    var _jobjectmut_insert_f64: fn_jobjectmut_insert_f64

    var _jobjectmut_insert_str: fn_jobjectmut_insert_str

    var _jobjectmut_insert_value: fn_jobjectmut_insert_value

    var _jobjectmut_insert_object: fn_jobjectmut_insert_object

    var _jobjectmut_insert_array: fn_jobjectmut_insert_array

    var _jobjectmut_remove: fn_jobjectmut_remove

    var _jobjectmut_len: fn_jobjectmut_len

    var _jobjectmut_is_empty: fn_jobjectmut_is_empty

    var _jobjectmut_get_value: fn_jobjectmut_get_value

    var _jobjectmut_get_value_ref: fn_jobjectmut_get_value_ref

    var _jobjectmut_get_value_mut: fn_jobjectmut_get_value_mut

    var _jobjectmut_get_object_mut: fn_jobjectmut_get_object_mut

    var _jobjectmut_get_array_mut: fn_jobjectmut_get_array_mut

    var _jobjectmut_get_bool: fn_jobjectmut_get_bool

    var _jobjectmut_get_i64: fn_jobjectmut_get_i64

    var _jobjectmut_get_u64: fn_jobjectmut_get_u64

    var _jobjectmut_get_f64: fn_jobjectmut_get_f64

    var _jobjectmut_get_str: fn_jobjectmut_get_str

    var _jobjectmut_keys_iter: fn_jobjectmut_keys_iter

    var _jobjectmut_iter: fn_jobjectmut_iter

    var _jobjectmut_destroy: fn_jobjectmut_destroy

    var _jobjectref_clone: fn_jobjectref_clone

    var _jobjectref_to_string: fn_jobjectref_to_string

    var _jobjectref_capacity: fn_jobjectref_capacity

    var _jobjectref_contains_key: fn_jobjectref_contains_key

    var _jobjectref_len: fn_jobjectref_len

    var _jobjectref_is_empty: fn_jobjectref_is_empty

    var _jobjectref_get_value: fn_jobjectref_get_value

    var _jobjectref_get_value_ref: fn_jobjectref_get_value_ref

    var _jobjectref_get_object_ref: fn_jobjectref_get_object_ref

    var _jobjectref_get_array_ref: fn_jobjectref_get_array_ref

    var _jobjectref_get_bool: fn_jobjectref_get_bool

    var _jobjectref_get_i64: fn_jobjectref_get_i64

    var _jobjectref_get_u64: fn_jobjectref_get_u64

    var _jobjectref_get_f64: fn_jobjectref_get_f64

    var _jobjectref_get_str: fn_jobjectref_get_str

    var _jobjectref_keys_iter: fn_jobjectref_keys_iter

    var _jobjectref_iter: fn_jobjectref_iter

    var _jobjectref_destroy: fn_jobjectref_destroy

    var _jvalue_new: fn_jvalue_new

    var _jvalue_new_bool: fn_jvalue_new_bool

    var _jvalue_new_i64: fn_jvalue_new_i64

    var _jvalue_new_u64: fn_jvalue_new_u64

    var _jvalue_new_f64: fn_jvalue_new_f64

    var _jvalue_new_str: fn_jvalue_new_str

    var _jvalue_from_str: fn_jvalue_from_str

    var _jvalue_clone: fn_jvalue_clone

    var _jvalue_get_type: fn_jvalue_get_type

    var _jvalue_is_boolean: fn_jvalue_is_boolean

    var _jvalue_is_true: fn_jvalue_is_true

    var _jvalue_is_false: fn_jvalue_is_false

    var _jvalue_is_null: fn_jvalue_is_null

    var _jvalue_is_number: fn_jvalue_is_number

    var _jvalue_is_str: fn_jvalue_is_str

    var _jvalue_is_array: fn_jvalue_is_array

    var _jvalue_is_object: fn_jvalue_is_object

    var _jvalue_is_f64: fn_jvalue_is_f64

    var _jvalue_is_i64: fn_jvalue_is_i64

    var _jvalue_is_u64: fn_jvalue_is_u64

    var _jvalue_as_bool: fn_jvalue_as_bool

    var _jvalue_as_i64: fn_jvalue_as_i64

    var _jvalue_as_u64: fn_jvalue_as_u64

    var _jvalue_as_f64: fn_jvalue_as_f64

    var _jvalue_as_str: fn_jvalue_as_str

    var _jvalue_as_object: fn_jvalue_as_object

    var _jvalue_as_object_mut: fn_jvalue_as_object_mut

    var _jvalue_as_array: fn_jvalue_as_array

    var _jvalue_as_array_mut: fn_jvalue_as_array_mut

    var _jvalue_to_string: fn_jvalue_to_string

    var _jvalue_destroy: fn_jvalue_destroy

    var _jvalueiter_len: fn_jvalueiter_len

    var _jvalueiter_next: fn_jvalueiter_next

    var _jvalueiter_destroy: fn_jvalueiter_destroy

    var _jvalueitermut_len: fn_jvalueitermut_len

    var _jvalueitermut_next: fn_jvalueitermut_next

    var _jvalueitermut_destroy: fn_jvalueitermut_destroy

    var _jvaluemut_clone: fn_jvaluemut_clone

    var _jvaluemut_get_type: fn_jvaluemut_get_type

    var _jvaluemut_is_boolean: fn_jvaluemut_is_boolean

    var _jvaluemut_is_true: fn_jvaluemut_is_true

    var _jvaluemut_is_false: fn_jvaluemut_is_false

    var _jvaluemut_is_null: fn_jvaluemut_is_null

    var _jvaluemut_is_number: fn_jvaluemut_is_number

    var _jvaluemut_is_str: fn_jvaluemut_is_str

    var _jvaluemut_is_array: fn_jvaluemut_is_array

    var _jvaluemut_is_object: fn_jvaluemut_is_object

    var _jvaluemut_is_f64: fn_jvaluemut_is_f64

    var _jvaluemut_is_i64: fn_jvaluemut_is_i64

    var _jvaluemut_is_u64: fn_jvaluemut_is_u64

    var _jvaluemut_as_bool: fn_jvaluemut_as_bool

    var _jvaluemut_as_i64: fn_jvaluemut_as_i64

    var _jvaluemut_as_u64: fn_jvaluemut_as_u64

    var _jvaluemut_as_f64: fn_jvaluemut_as_f64

    var _jvaluemut_as_str: fn_jvaluemut_as_str

    var _jvaluemut_as_object_mut: fn_jvaluemut_as_object_mut

    var _jvaluemut_as_array_mut: fn_jvaluemut_as_array_mut

    var _jvaluemut_to_string: fn_jvaluemut_to_string

    var _jvaluemut_destroy: fn_jvaluemut_destroy

    var _jvalueref_clone: fn_jvalueref_clone

    var _jvalueref_get_type: fn_jvalueref_get_type

    var _jvalueref_is_true: fn_jvalueref_is_true

    var _jvalueref_is_false: fn_jvalueref_is_false

    var _jvalueref_is_i64: fn_jvalueref_is_i64

    var _jvalueref_is_u64: fn_jvalueref_is_u64

    var _jvalueref_is_f64: fn_jvalueref_is_f64

    var _jvalueref_is_str: fn_jvalueref_is_str

    var _jvalueref_is_object: fn_jvalueref_is_object

    var _jvalueref_is_array: fn_jvalueref_is_array

    var _jvalueref_as_bool: fn_jvalueref_as_bool

    var _jvalueref_as_i64: fn_jvalueref_as_i64

    var _jvalueref_as_u64: fn_jvalueref_as_u64

    var _jvalueref_as_f64: fn_jvalueref_as_f64

    var _jvalueref_as_str: fn_jvalueref_as_str

    var _jvalueref_as_object: fn_jvalueref_as_object

    var _jvalueref_as_object_ref: fn_jvalueref_as_object_ref

    var _jvalueref_as_array: fn_jvalueref_as_array

    var _jvalueref_as_array_ref: fn_jvalueref_as_array_ref

    var _jvalueref_to_string: fn_jvalueref_to_string

    var _jvalueref_destroy: fn_jvalueref_destroy

    fn __init__(out self):
        try:
            self._handle = DLHandle(LIBNAME)
        except e:
            self._handle = abort[DLHandle](
                String("Failed to load libpython from", LIBNAME, ":\n", e)
            )

        self._diplomat_simple_write = self._handle.get_function[
            fn_diplomat_simple_write
        ]("diplomat_simple_write")

        self._diplomat_buffer_write_create = self._handle.get_function[
            fn_diplomat_buffer_write_create
        ]("diplomat_buffer_write_create")

        self._diplomat_buffer_write_get_bytes = self._handle.get_function[
            fn_diplomat_buffer_write_get_bytes
        ]("diplomat_buffer_write_get_bytes")

        self._diplomat_buffer_write_len = self._handle.get_function[
            fn_diplomat_buffer_write_len
        ]("diplomat_buffer_write_len")

        self._diplomat_buffer_write_destroy = self._handle.get_function[
            fn_diplomat_buffer_write_destroy
        ]("diplomat_buffer_write_destroy")

        self._jarray_new = self._handle.get_function[fn_jarray_new](
            "JArray_new"
        )

        self._jarray_from_str = self._handle.get_function[fn_jarray_from_str](
            "JArray_from_str"
        )

        self._jarray_with_capacity = self._handle.get_function[
            fn_jarray_with_capacity
        ]("JArray_with_capacity")

        self._jarray_clone = self._handle.get_function[fn_jarray_clone](
            "JArray_clone"
        )

        self._jarray_to_string = self._handle.get_function[fn_jarray_to_string](
            "JArray_to_string"
        )

        self._jarray_push_null = self._handle.get_function[fn_jarray_push_null](
            "JArray_push_null"
        )

        self._jarray_push_bool = self._handle.get_function[fn_jarray_push_bool](
            "JArray_push_bool"
        )

        self._jarray_push_i64 = self._handle.get_function[fn_jarray_push_i64](
            "JArray_push_i64"
        )

        self._jarray_push_u64 = self._handle.get_function[fn_jarray_push_u64](
            "JArray_push_u64"
        )

        self._jarray_push_f64 = self._handle.get_function[fn_jarray_push_f64](
            "JArray_push_f64"
        )

        self._jarray_push_str = self._handle.get_function[fn_jarray_push_str](
            "JArray_push_str"
        )

        self._jarray_push_value = self._handle.get_function[
            fn_jarray_push_value
        ]("JArray_push_value")

        self._jarray_push_object = self._handle.get_function[
            fn_jarray_push_object
        ]("JArray_push_object")

        self._jarray_push_array = self._handle.get_function[
            fn_jarray_push_array
        ]("JArray_push_array")

        self._jarray_insert = self._handle.get_function[fn_jarray_insert](
            "JArray_insert"
        )

        self._jarray_pop = self._handle.get_function[fn_jarray_pop](
            "JArray_pop"
        )

        self._jarray_len = self._handle.get_function[fn_jarray_len](
            "JArray_len"
        )

        self._jarray_is_empty = self._handle.get_function[fn_jarray_is_empty](
            "JArray_is_empty"
        )

        self._jarray_clear = self._handle.get_function[fn_jarray_clear](
            "JArray_clear"
        )

        self._jarray_remove = self._handle.get_function[fn_jarray_remove](
            "JArray_remove"
        )

        self._jarray_get = self._handle.get_function[fn_jarray_get](
            "JArray_get"
        )

        self._jarray_get_mut = self._handle.get_function[fn_jarray_get_mut](
            "JArray_get_mut"
        )

        self._jarray_iter = self._handle.get_function[fn_jarray_iter](
            "JArray_iter"
        )

        self._jarray_destroy = self._handle.get_function[fn_jarray_destroy](
            "JArray_destroy"
        )

        self._jarraymut_clone = self._handle.get_function[fn_jarraymut_clone](
            "JArrayMut_clone"
        )

        self._jarraymut_to_string = self._handle.get_function[
            fn_jarraymut_to_string
        ]("JArrayMut_to_string")

        self._jarraymut_push_null = self._handle.get_function[
            fn_jarraymut_push_null
        ]("JArrayMut_push_null")

        self._jarraymut_push_bool = self._handle.get_function[
            fn_jarraymut_push_bool
        ]("JArrayMut_push_bool")

        self._jarraymut_push_i64 = self._handle.get_function[
            fn_jarraymut_push_i64
        ]("JArrayMut_push_i64")

        self._jarraymut_push_u64 = self._handle.get_function[
            fn_jarraymut_push_u64
        ]("JArrayMut_push_u64")

        self._jarraymut_push_f64 = self._handle.get_function[
            fn_jarraymut_push_f64
        ]("JArrayMut_push_f64")

        self._jarraymut_push_str = self._handle.get_function[
            fn_jarraymut_push_str
        ]("JArrayMut_push_str")

        self._jarraymut_push_value = self._handle.get_function[
            fn_jarraymut_push_value
        ]("JArrayMut_push_value")

        self._jarraymut_push_object = self._handle.get_function[
            fn_jarraymut_push_object
        ]("JArrayMut_push_object")

        self._jarraymut_push_array = self._handle.get_function[
            fn_jarraymut_push_array
        ]("JArrayMut_push_array")

        self._jarraymut_insert = self._handle.get_function[fn_jarraymut_insert](
            "JArrayMut_insert"
        )

        self._jarraymut_pop = self._handle.get_function[fn_jarraymut_pop](
            "JArrayMut_pop"
        )

        self._jarraymut_len = self._handle.get_function[fn_jarraymut_len](
            "JArrayMut_len"
        )

        self._jarraymut_is_empty = self._handle.get_function[
            fn_jarraymut_is_empty
        ]("JArrayMut_is_empty")

        self._jarraymut_clear = self._handle.get_function[fn_jarraymut_clear](
            "JArrayMut_clear"
        )

        self._jarraymut_remove = self._handle.get_function[fn_jarraymut_remove](
            "JArrayMut_remove"
        )

        self._jarraymut_get = self._handle.get_function[fn_jarraymut_get](
            "JArrayMut_get"
        )

        self._jarraymut_get_mut = self._handle.get_function[
            fn_jarraymut_get_mut
        ]("JArrayMut_get_mut")

        self._jarraymut_iter = self._handle.get_function[fn_jarraymut_iter](
            "JArrayMut_iter"
        )

        self._jarraymut_iter_mut = self._handle.get_function[
            fn_jarraymut_iter_mut
        ]("JArrayMut_iter_mut")

        self._jarraymut_destroy = self._handle.get_function[
            fn_jarraymut_destroy
        ]("JArrayMut_destroy")

        self._jarrayref_clone = self._handle.get_function[fn_jarrayref_clone](
            "JArrayRef_clone"
        )

        self._jarrayref_to_string = self._handle.get_function[
            fn_jarrayref_to_string
        ]("JArrayRef_to_string")

        self._jarrayref_len = self._handle.get_function[fn_jarrayref_len](
            "JArrayRef_len"
        )

        self._jarrayref_is_empty = self._handle.get_function[
            fn_jarrayref_is_empty
        ]("JArrayRef_is_empty")

        self._jarrayref_get = self._handle.get_function[fn_jarrayref_get](
            "JArrayRef_get"
        )

        self._jarrayref_iter = self._handle.get_function[fn_jarrayref_iter](
            "JArrayRef_iter"
        )

        self._jarrayref_destroy = self._handle.get_function[
            fn_jarrayref_destroy
        ]("JArrayRef_destroy")

        self._jkeysiter_next = self._handle.get_function[fn_jkeysiter_next](
            "JKeysIter_next"
        )

        self._jkeysiter_len = self._handle.get_function[fn_jkeysiter_len](
            "JKeysIter_len"
        )

        self._jkeysiter_get = self._handle.get_function[fn_jkeysiter_get](
            "JKeysIter_get"
        )

        self._jkeysiter_destroy = self._handle.get_function[
            fn_jkeysiter_destroy
        ]("JKeysIter_destroy")

        self._jkeyvaluemut_get_key = self._handle.get_function[
            fn_jkeyvaluemut_get_key
        ]("JKeyValueMut_get_key")

        self._jkeyvaluemut_get_value_mut = self._handle.get_function[
            fn_jkeyvaluemut_get_value_mut
        ]("JKeyValueMut_get_value_mut")

        self._jkeyvaluemut_destroy = self._handle.get_function[
            fn_jkeyvaluemut_destroy
        ]("JKeyValueMut_destroy")

        self._jkeyvalueref_get_key = self._handle.get_function[
            fn_jkeyvalueref_get_key
        ]("JKeyValueRef_get_key")

        self._jkeyvalueref_get_value = self._handle.get_function[
            fn_jkeyvalueref_get_value
        ]("JKeyValueRef_get_value")

        self._jkeyvalueref_destroy = self._handle.get_function[
            fn_jkeyvalueref_destroy
        ]("JKeyValueRef_destroy")

        self._jobject_new = self._handle.get_function[fn_jobject_new](
            "JObject_new"
        )

        self._jobject_with_capacity = self._handle.get_function[
            fn_jobject_with_capacity
        ]("JObject_with_capacity")

        self._jobject_from_str = self._handle.get_function[fn_jobject_from_str](
            "JObject_from_str"
        )

        self._jobject_clone = self._handle.get_function[fn_jobject_clone](
            "JObject_clone"
        )

        self._jobject_to_string = self._handle.get_function[
            fn_jobject_to_string
        ]("JObject_to_string")

        self._jobject_clear = self._handle.get_function[fn_jobject_clear](
            "JObject_clear"
        )

        self._jobject_capacity = self._handle.get_function[fn_jobject_capacity](
            "JObject_capacity"
        )

        self._jobject_contains_key = self._handle.get_function[
            fn_jobject_contains_key
        ]("JObject_contains_key")

        self._jobject_insert_null = self._handle.get_function[
            fn_jobject_insert_null
        ]("JObject_insert_null")

        self._jobject_insert_bool = self._handle.get_function[
            fn_jobject_insert_bool
        ]("JObject_insert_bool")

        self._jobject_insert_i64 = self._handle.get_function[
            fn_jobject_insert_i64
        ]("JObject_insert_i64")

        self._jobject_insert_u64 = self._handle.get_function[
            fn_jobject_insert_u64
        ]("JObject_insert_u64")

        self._jobject_insert_f64 = self._handle.get_function[
            fn_jobject_insert_f64
        ]("JObject_insert_f64")

        self._jobject_insert_str = self._handle.get_function[
            fn_jobject_insert_str
        ]("JObject_insert_str")

        self._jobject_insert_value = self._handle.get_function[
            fn_jobject_insert_value
        ]("JObject_insert_value")

        self._jobject_insert_object = self._handle.get_function[
            fn_jobject_insert_object
        ]("JObject_insert_object")

        self._jobject_insert_array = self._handle.get_function[
            fn_jobject_insert_array
        ]("JObject_insert_array")

        self._jobject_remove = self._handle.get_function[fn_jobject_remove](
            "JObject_remove"
        )

        self._jobject_len = self._handle.get_function[fn_jobject_len](
            "JObject_len"
        )

        self._jobject_is_empty = self._handle.get_function[fn_jobject_is_empty](
            "JObject_is_empty"
        )

        self._jobject_get_value = self._handle.get_function[
            fn_jobject_get_value
        ]("JObject_get_value")

        self._jobject_get_value_ref = self._handle.get_function[
            fn_jobject_get_value_ref
        ]("JObject_get_value_ref")

        self._jobject_get_object_ref = self._handle.get_function[
            fn_jobject_get_object_ref
        ]("JObject_get_object_ref")

        self._jobject_get_array_ref = self._handle.get_function[
            fn_jobject_get_array_ref
        ]("JObject_get_array_ref")

        self._jobject_get_value_mut = self._handle.get_function[
            fn_jobject_get_value_mut
        ]("JObject_get_value_mut")

        self._jobject_get_object_mut = self._handle.get_function[
            fn_jobject_get_object_mut
        ]("JObject_get_object_mut")

        self._jobject_get_array_mut = self._handle.get_function[
            fn_jobject_get_array_mut
        ]("JObject_get_array_mut")

        self._jobject_get_bool = self._handle.get_function[fn_jobject_get_bool](
            "JObject_get_bool"
        )

        self._jobject_get_i64 = self._handle.get_function[fn_jobject_get_i64](
            "JObject_get_i64"
        )

        self._jobject_get_u64 = self._handle.get_function[fn_jobject_get_u64](
            "JObject_get_u64"
        )

        self._jobject_get_f64 = self._handle.get_function[fn_jobject_get_f64](
            "JObject_get_f64"
        )

        self._jobject_get_str = self._handle.get_function[fn_jobject_get_str](
            "JObject_get_str"
        )

        self._jobject_keys_iter = self._handle.get_function[
            fn_jobject_keys_iter
        ]("JObject_keys_iter")

        self._jobject_iter = self._handle.get_function[fn_jobject_iter](
            "JObject_iter"
        )

        self._jobject_iter_mut = self._handle.get_function[fn_jobject_iter_mut](
            "JObject_iter_mut"
        )

        self._jobject_destroy = self._handle.get_function[fn_jobject_destroy](
            "JObject_destroy"
        )

        self._jobjectiter_next = self._handle.get_function[fn_jobjectiter_next](
            "JObjectIter_next"
        )

        self._jobjectiter_destroy = self._handle.get_function[
            fn_jobjectiter_destroy
        ]("JObjectIter_destroy")

        self._jobjectitermut_next = self._handle.get_function[
            fn_jobjectitermut_next
        ]("JObjectIterMut_next")

        self._jobjectitermut_destroy = self._handle.get_function[
            fn_jobjectitermut_destroy
        ]("JObjectIterMut_destroy")

        self._jobjectmut_clone = self._handle.get_function[fn_jobjectmut_clone](
            "JObjectMut_clone"
        )

        self._jobjectmut_to_string = self._handle.get_function[
            fn_jobjectmut_to_string
        ]("JObjectMut_to_string")

        self._jobjectmut_clear = self._handle.get_function[fn_jobjectmut_clear](
            "JObjectMut_clear"
        )

        self._jobjectmut_capacity = self._handle.get_function[
            fn_jobjectmut_capacity
        ]("JObjectMut_capacity")

        self._jobjectmut_contains_key = self._handle.get_function[
            fn_jobjectmut_contains_key
        ]("JObjectMut_contains_key")

        self._jobjectmut_insert_null = self._handle.get_function[
            fn_jobjectmut_insert_null
        ]("JObjectMut_insert_null")

        self._jobjectmut_insert_bool = self._handle.get_function[
            fn_jobjectmut_insert_bool
        ]("JObjectMut_insert_bool")

        self._jobjectmut_insert_i64 = self._handle.get_function[
            fn_jobjectmut_insert_i64
        ]("JObjectMut_insert_i64")

        self._jobjectmut_insert_u64 = self._handle.get_function[
            fn_jobjectmut_insert_u64
        ]("JObjectMut_insert_u64")

        self._jobjectmut_insert_f64 = self._handle.get_function[
            fn_jobjectmut_insert_f64
        ]("JObjectMut_insert_f64")

        self._jobjectmut_insert_str = self._handle.get_function[
            fn_jobjectmut_insert_str
        ]("JObjectMut_insert_str")

        self._jobjectmut_insert_value = self._handle.get_function[
            fn_jobjectmut_insert_value
        ]("JObjectMut_insert_value")

        self._jobjectmut_insert_object = self._handle.get_function[
            fn_jobjectmut_insert_object
        ]("JObjectMut_insert_object")

        self._jobjectmut_insert_array = self._handle.get_function[
            fn_jobjectmut_insert_array
        ]("JObjectMut_insert_array")

        self._jobjectmut_remove = self._handle.get_function[
            fn_jobjectmut_remove
        ]("JObjectMut_remove")

        self._jobjectmut_len = self._handle.get_function[fn_jobjectmut_len](
            "JObjectMut_len"
        )

        self._jobjectmut_is_empty = self._handle.get_function[
            fn_jobjectmut_is_empty
        ]("JObjectMut_is_empty")

        self._jobjectmut_get_value = self._handle.get_function[
            fn_jobjectmut_get_value
        ]("JObjectMut_get_value")

        self._jobjectmut_get_value_ref = self._handle.get_function[
            fn_jobjectmut_get_value_ref
        ]("JObjectMut_get_value_ref")

        self._jobjectmut_get_value_mut = self._handle.get_function[
            fn_jobjectmut_get_value_mut
        ]("JObjectMut_get_value_mut")

        self._jobjectmut_get_object_mut = self._handle.get_function[
            fn_jobjectmut_get_object_mut
        ]("JObjectMut_get_object_mut")

        self._jobjectmut_get_array_mut = self._handle.get_function[
            fn_jobjectmut_get_array_mut
        ]("JObjectMut_get_array_mut")

        self._jobjectmut_get_bool = self._handle.get_function[
            fn_jobjectmut_get_bool
        ]("JObjectMut_get_bool")

        self._jobjectmut_get_i64 = self._handle.get_function[
            fn_jobjectmut_get_i64
        ]("JObjectMut_get_i64")

        self._jobjectmut_get_u64 = self._handle.get_function[
            fn_jobjectmut_get_u64
        ]("JObjectMut_get_u64")

        self._jobjectmut_get_f64 = self._handle.get_function[
            fn_jobjectmut_get_f64
        ]("JObjectMut_get_f64")

        self._jobjectmut_get_str = self._handle.get_function[
            fn_jobjectmut_get_str
        ]("JObjectMut_get_str")

        self._jobjectmut_keys_iter = self._handle.get_function[
            fn_jobjectmut_keys_iter
        ]("JObjectMut_keys_iter")

        self._jobjectmut_iter = self._handle.get_function[fn_jobjectmut_iter](
            "JObjectMut_iter"
        )

        self._jobjectmut_destroy = self._handle.get_function[
            fn_jobjectmut_destroy
        ]("JObjectMut_destroy")

        self._jobjectref_clone = self._handle.get_function[fn_jobjectref_clone](
            "JObjectRef_clone"
        )

        self._jobjectref_to_string = self._handle.get_function[
            fn_jobjectref_to_string
        ]("JObjectRef_to_string")

        self._jobjectref_capacity = self._handle.get_function[
            fn_jobjectref_capacity
        ]("JObjectRef_capacity")

        self._jobjectref_contains_key = self._handle.get_function[
            fn_jobjectref_contains_key
        ]("JObjectRef_contains_key")

        self._jobjectref_len = self._handle.get_function[fn_jobjectref_len](
            "JObjectRef_len"
        )

        self._jobjectref_is_empty = self._handle.get_function[
            fn_jobjectref_is_empty
        ]("JObjectRef_is_empty")

        self._jobjectref_get_value = self._handle.get_function[
            fn_jobjectref_get_value
        ]("JObjectRef_get_value")

        self._jobjectref_get_value_ref = self._handle.get_function[
            fn_jobjectref_get_value_ref
        ]("JObjectRef_get_value_ref")

        self._jobjectref_get_object_ref = self._handle.get_function[
            fn_jobjectref_get_object_ref
        ]("JObjectRef_get_object_ref")

        self._jobjectref_get_array_ref = self._handle.get_function[
            fn_jobjectref_get_array_ref
        ]("JObjectRef_get_array_ref")

        self._jobjectref_get_bool = self._handle.get_function[
            fn_jobjectref_get_bool
        ]("JObjectRef_get_bool")

        self._jobjectref_get_i64 = self._handle.get_function[
            fn_jobjectref_get_i64
        ]("JObjectRef_get_i64")

        self._jobjectref_get_u64 = self._handle.get_function[
            fn_jobjectref_get_u64
        ]("JObjectRef_get_u64")

        self._jobjectref_get_f64 = self._handle.get_function[
            fn_jobjectref_get_f64
        ]("JObjectRef_get_f64")

        self._jobjectref_get_str = self._handle.get_function[
            fn_jobjectref_get_str
        ]("JObjectRef_get_str")

        self._jobjectref_keys_iter = self._handle.get_function[
            fn_jobjectref_keys_iter
        ]("JObjectRef_keys_iter")

        self._jobjectref_iter = self._handle.get_function[fn_jobjectref_iter](
            "JObjectRef_iter"
        )

        self._jobjectref_destroy = self._handle.get_function[
            fn_jobjectref_destroy
        ]("JObjectRef_destroy")

        self._jvalue_new = self._handle.get_function[fn_jvalue_new](
            "JValue_new"
        )

        self._jvalue_new_bool = self._handle.get_function[fn_jvalue_new_bool](
            "JValue_new_bool"
        )

        self._jvalue_new_i64 = self._handle.get_function[fn_jvalue_new_i64](
            "JValue_new_i64"
        )

        self._jvalue_new_u64 = self._handle.get_function[fn_jvalue_new_u64](
            "JValue_new_u64"
        )

        self._jvalue_new_f64 = self._handle.get_function[fn_jvalue_new_f64](
            "JValue_new_f64"
        )

        self._jvalue_new_str = self._handle.get_function[fn_jvalue_new_str](
            "JValue_new_str"
        )

        self._jvalue_from_str = self._handle.get_function[fn_jvalue_from_str](
            "JValue_from_str"
        )

        self._jvalue_clone = self._handle.get_function[fn_jvalue_clone](
            "JValue_clone"
        )

        self._jvalue_get_type = self._handle.get_function[fn_jvalue_get_type](
            "JValue_get_type"
        )

        self._jvalue_is_boolean = self._handle.get_function[
            fn_jvalue_is_boolean
        ]("JValue_is_boolean")

        self._jvalue_is_true = self._handle.get_function[fn_jvalue_is_true](
            "JValue_is_true"
        )

        self._jvalue_is_false = self._handle.get_function[fn_jvalue_is_false](
            "JValue_is_false"
        )

        self._jvalue_is_null = self._handle.get_function[fn_jvalue_is_null](
            "JValue_is_null"
        )

        self._jvalue_is_number = self._handle.get_function[fn_jvalue_is_number](
            "JValue_is_number"
        )

        self._jvalue_is_str = self._handle.get_function[fn_jvalue_is_str](
            "JValue_is_str"
        )

        self._jvalue_is_array = self._handle.get_function[fn_jvalue_is_array](
            "JValue_is_array"
        )

        self._jvalue_is_object = self._handle.get_function[fn_jvalue_is_object](
            "JValue_is_object"
        )

        self._jvalue_is_f64 = self._handle.get_function[fn_jvalue_is_f64](
            "JValue_is_f64"
        )

        self._jvalue_is_i64 = self._handle.get_function[fn_jvalue_is_i64](
            "JValue_is_i64"
        )

        self._jvalue_is_u64 = self._handle.get_function[fn_jvalue_is_u64](
            "JValue_is_u64"
        )

        self._jvalue_as_bool = self._handle.get_function[fn_jvalue_as_bool](
            "JValue_as_bool"
        )

        self._jvalue_as_i64 = self._handle.get_function[fn_jvalue_as_i64](
            "JValue_as_i64"
        )

        self._jvalue_as_u64 = self._handle.get_function[fn_jvalue_as_u64](
            "JValue_as_u64"
        )

        self._jvalue_as_f64 = self._handle.get_function[fn_jvalue_as_f64](
            "JValue_as_f64"
        )

        self._jvalue_as_str = self._handle.get_function[fn_jvalue_as_str](
            "JValue_as_str"
        )

        self._jvalue_as_object = self._handle.get_function[fn_jvalue_as_object](
            "JValue_as_object"
        )

        self._jvalue_as_object_mut = self._handle.get_function[
            fn_jvalue_as_object_mut
        ]("JValue_as_object_mut")

        self._jvalue_as_array = self._handle.get_function[fn_jvalue_as_array](
            "JValue_as_array"
        )

        self._jvalue_as_array_mut = self._handle.get_function[
            fn_jvalue_as_array_mut
        ]("JValue_as_array_mut")

        self._jvalue_to_string = self._handle.get_function[fn_jvalue_to_string](
            "JValue_to_string"
        )

        self._jvalue_destroy = self._handle.get_function[fn_jvalue_destroy](
            "JValue_destroy"
        )

        self._jvalueiter_len = self._handle.get_function[fn_jvalueiter_len](
            "JValueIter_len"
        )

        self._jvalueiter_next = self._handle.get_function[fn_jvalueiter_next](
            "JValueIter_next"
        )

        self._jvalueiter_destroy = self._handle.get_function[
            fn_jvalueiter_destroy
        ]("JValueIter_destroy")

        self._jvalueitermut_len = self._handle.get_function[
            fn_jvalueitermut_len
        ]("JValueIterMut_len")

        self._jvalueitermut_next = self._handle.get_function[
            fn_jvalueitermut_next
        ]("JValueIterMut_next")

        self._jvalueitermut_destroy = self._handle.get_function[
            fn_jvalueitermut_destroy
        ]("JValueIterMut_destroy")

        self._jvaluemut_clone = self._handle.get_function[fn_jvaluemut_clone](
            "JValueMut_clone"
        )

        self._jvaluemut_get_type = self._handle.get_function[
            fn_jvaluemut_get_type
        ]("JValueMut_get_type")

        self._jvaluemut_is_boolean = self._handle.get_function[
            fn_jvaluemut_is_boolean
        ]("JValueMut_is_boolean")

        self._jvaluemut_is_true = self._handle.get_function[
            fn_jvaluemut_is_true
        ]("JValueMut_is_true")

        self._jvaluemut_is_false = self._handle.get_function[
            fn_jvaluemut_is_false
        ]("JValueMut_is_false")

        self._jvaluemut_is_null = self._handle.get_function[
            fn_jvaluemut_is_null
        ]("JValueMut_is_null")

        self._jvaluemut_is_number = self._handle.get_function[
            fn_jvaluemut_is_number
        ]("JValueMut_is_number")

        self._jvaluemut_is_str = self._handle.get_function[fn_jvaluemut_is_str](
            "JValueMut_is_str"
        )

        self._jvaluemut_is_array = self._handle.get_function[
            fn_jvaluemut_is_array
        ]("JValueMut_is_array")

        self._jvaluemut_is_object = self._handle.get_function[
            fn_jvaluemut_is_object
        ]("JValueMut_is_object")

        self._jvaluemut_is_f64 = self._handle.get_function[fn_jvaluemut_is_f64](
            "JValueMut_is_f64"
        )

        self._jvaluemut_is_i64 = self._handle.get_function[fn_jvaluemut_is_i64](
            "JValueMut_is_i64"
        )

        self._jvaluemut_is_u64 = self._handle.get_function[fn_jvaluemut_is_u64](
            "JValueMut_is_u64"
        )

        self._jvaluemut_as_bool = self._handle.get_function[
            fn_jvaluemut_as_bool
        ]("JValueMut_as_bool")

        self._jvaluemut_as_i64 = self._handle.get_function[fn_jvaluemut_as_i64](
            "JValueMut_as_i64"
        )

        self._jvaluemut_as_u64 = self._handle.get_function[fn_jvaluemut_as_u64](
            "JValueMut_as_u64"
        )

        self._jvaluemut_as_f64 = self._handle.get_function[fn_jvaluemut_as_f64](
            "JValueMut_as_f64"
        )

        self._jvaluemut_as_str = self._handle.get_function[fn_jvaluemut_as_str](
            "JValueMut_as_str"
        )

        self._jvaluemut_as_object_mut = self._handle.get_function[
            fn_jvaluemut_as_object_mut
        ]("JValueMut_as_object_mut")

        self._jvaluemut_as_array_mut = self._handle.get_function[
            fn_jvaluemut_as_array_mut
        ]("JValueMut_as_array_mut")

        self._jvaluemut_to_string = self._handle.get_function[
            fn_jvaluemut_to_string
        ]("JValueMut_to_string")

        self._jvaluemut_destroy = self._handle.get_function[
            fn_jvaluemut_destroy
        ]("JValueMut_destroy")

        self._jvalueref_clone = self._handle.get_function[fn_jvalueref_clone](
            "JValueRef_clone"
        )

        self._jvalueref_get_type = self._handle.get_function[
            fn_jvalueref_get_type
        ]("JValueRef_get_type")

        self._jvalueref_is_true = self._handle.get_function[
            fn_jvalueref_is_true
        ]("JValueRef_is_true")

        self._jvalueref_is_false = self._handle.get_function[
            fn_jvalueref_is_false
        ]("JValueRef_is_false")

        self._jvalueref_is_i64 = self._handle.get_function[fn_jvalueref_is_i64](
            "JValueRef_is_i64"
        )

        self._jvalueref_is_u64 = self._handle.get_function[fn_jvalueref_is_u64](
            "JValueRef_is_u64"
        )

        self._jvalueref_is_f64 = self._handle.get_function[fn_jvalueref_is_f64](
            "JValueRef_is_f64"
        )

        self._jvalueref_is_str = self._handle.get_function[fn_jvalueref_is_str](
            "JValueRef_is_str"
        )

        self._jvalueref_is_object = self._handle.get_function[
            fn_jvalueref_is_object
        ]("JValueRef_is_object")

        self._jvalueref_is_array = self._handle.get_function[
            fn_jvalueref_is_array
        ]("JValueRef_is_array")

        self._jvalueref_as_bool = self._handle.get_function[
            fn_jvalueref_as_bool
        ]("JValueRef_as_bool")

        self._jvalueref_as_i64 = self._handle.get_function[fn_jvalueref_as_i64](
            "JValueRef_as_i64"
        )

        self._jvalueref_as_u64 = self._handle.get_function[fn_jvalueref_as_u64](
            "JValueRef_as_u64"
        )

        self._jvalueref_as_f64 = self._handle.get_function[fn_jvalueref_as_f64](
            "JValueRef_as_f64"
        )

        self._jvalueref_as_str = self._handle.get_function[fn_jvalueref_as_str](
            "JValueRef_as_str"
        )

        self._jvalueref_as_object = self._handle.get_function[
            fn_jvalueref_as_object
        ]("JValueRef_as_object")

        self._jvalueref_as_object_ref = self._handle.get_function[
            fn_jvalueref_as_object_ref
        ]("JValueRef_as_object_ref")

        self._jvalueref_as_array = self._handle.get_function[
            fn_jvalueref_as_array
        ]("JValueRef_as_array")

        self._jvalueref_as_array_ref = self._handle.get_function[
            fn_jvalueref_as_array_ref
        ]("JValueRef_as_array_ref")

        self._jvalueref_to_string = self._handle.get_function[
            fn_jvalueref_to_string
        ]("JValueRef_to_string")

        self._jvalueref_destroy = self._handle.get_function[
            fn_jvalueref_destroy
        ]("JValueRef_destroy")

    @always_inline
    fn diplomat_simple_write(
        self, buf: c_void_ptr, buf_size: c_size_t
    ) -> UnsafePointer[DiplomatWrite]:
        return self._diplomat_simple_write(buf, buf_size)

    @always_inline
    fn diplomat_buffer_write_create(
        self, cap: c_size_t
    ) -> UnsafePointer[DiplomatWrite]:
        return self._diplomat_buffer_write_create(cap)

    @always_inline
    fn diplomat_buffer_write_get_bytes(
        self,
        this: UnsafePointer[DiplomatWrite],
    ) -> c_void_ptr:
        return self._diplomat_buffer_write_get_bytes(this)

    @always_inline
    fn diplomat_buffer_write_len(
        self, this: UnsafePointer[DiplomatWrite]
    ) -> c_size_t:
        return self._diplomat_buffer_write_len(this)

    @always_inline
    fn diplomat_buffer_write_destroy(
        self, this: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._diplomat_buffer_write_destroy(this)

    @always_inline
    fn jarray_new(self) -> UnsafePointer[JArray]:
        return self._jarray_new()

    @always_inline
    fn jarray_from_str(self, s: DiplomatStringView) -> UnsafePointer[JArray]:
        return self._jarray_from_str(s)

    @always_inline
    fn jarray_with_capacity(self, capacity: c_size_t) -> UnsafePointer[JArray]:
        return self._jarray_with_capacity(capacity)

    @always_inline
    fn jarray_clone(self, p: UnsafePointer[JArray]) -> UnsafePointer[JArray]:
        return self._jarray_clone(p)

    @always_inline
    fn jarray_to_string(
        self, p: UnsafePointer[JArray], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jarray_to_string(p, write)

    @always_inline
    fn jarray_push_null(self, p: UnsafePointer[JArray]) -> None:
        return self._jarray_push_null(p)

    @always_inline
    fn jarray_push_bool(self, p: UnsafePointer[JArray], value: c_bool) -> None:
        return self._jarray_push_bool(p, value)

    @always_inline
    fn jarray_push_i64(self, p: UnsafePointer[JArray], value: c_int64) -> None:
        return self._jarray_push_i64(p, value)

    @always_inline
    fn jarray_push_u64(self, p: UnsafePointer[JArray], value: c_uint64) -> None:
        return self._jarray_push_u64(p, value)

    @always_inline
    fn jarray_push_f64(self, p: UnsafePointer[JArray], value: c_double) -> None:
        return self._jarray_push_f64(p, value)

    @always_inline
    fn jarray_push_str(
        self, p: UnsafePointer[JArray], value: DiplomatStringView
    ) -> None:
        return self._jarray_push_str(p, value)

    @always_inline
    fn jarray_push_value(
        self, p: UnsafePointer[JArray], value: UnsafePointer[JValue]
    ) -> None:
        return self._jarray_push_value(p, value)

    @always_inline
    fn jarray_push_object(
        self, p: UnsafePointer[JArray], value: UnsafePointer[JObject]
    ) -> None:
        return self._jarray_push_object(p, value)

    @always_inline
    fn jarray_push_array(
        self, p: UnsafePointer[JArray], value: UnsafePointer[JArray]
    ) -> None:
        return self._jarray_push_array(p, value)

    @always_inline
    fn jarray_insert(
        self,
        p: UnsafePointer[JArray],
        index: c_size_t,
        value: UnsafePointer[JValue],
    ) -> None:
        return self._jarray_insert(p, index, value)

    @always_inline
    fn jarray_pop(self, p: UnsafePointer[JArray]) -> UnsafePointer[JValue]:
        return self._jarray_pop(p)

    @always_inline
    fn jarray_len(self, p: UnsafePointer[JArray]) -> c_size_t:
        return self._jarray_len(p)

    @always_inline
    fn jarray_is_empty(self, p: UnsafePointer[JArray]) -> c_bool:
        return self._jarray_is_empty(p)

    @always_inline
    fn jarray_clear(self, p: UnsafePointer[JArray]) -> None:
        return self._jarray_clear(p)

    @always_inline
    fn jarray_remove(self, p: UnsafePointer[JArray], index: c_size_t) -> None:
        return self._jarray_remove(p, index)

    @always_inline
    fn jarray_get(
        self, p: UnsafePointer[JArray], index: c_size_t
    ) -> UnsafePointer[JValueRef]:
        return self._jarray_get(p, index)

    @always_inline
    fn jarray_get_mut(
        self, p: UnsafePointer[JArray], index: c_size_t
    ) -> UnsafePointer[JValueMut]:
        return self._jarray_get_mut(p, index)

    @always_inline
    fn jarray_iter(self, p: UnsafePointer[JArray]) -> UnsafePointer[JValueIter]:
        return self._jarray_iter(p)

    @always_inline
    fn jarray_destroy(self, p: UnsafePointer[JArray]) -> None:
        return self._jarray_destroy(p)

    @always_inline
    fn jarraymut_clone(
        self, p: UnsafePointer[JArrayMut]
    ) -> UnsafePointer[JArray]:
        return self._jarraymut_clone(p)

    @always_inline
    fn jarraymut_to_string(
        self, p: UnsafePointer[JArrayMut], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jarraymut_to_string(p, write)

    @always_inline
    fn jarraymut_push_null(self, p: UnsafePointer[JArrayMut]) -> None:
        return self._jarraymut_push_null(p)

    @always_inline
    fn jarraymut_push_bool(
        self, p: UnsafePointer[JArrayMut], value: c_bool
    ) -> None:
        return self._jarraymut_push_bool(p, value)

    @always_inline
    fn jarraymut_push_i64(
        self, p: UnsafePointer[JArrayMut], value: c_int64
    ) -> None:
        return self._jarraymut_push_i64(p, value)

    @always_inline
    fn jarraymut_push_u64(
        self, p: UnsafePointer[JArrayMut], value: c_uint64
    ) -> None:
        return self._jarraymut_push_u64(p, value)

    @always_inline
    fn jarraymut_push_f64(
        self, p: UnsafePointer[JArrayMut], value: c_double
    ) -> None:
        return self._jarraymut_push_f64(p, value)

    @always_inline
    fn jarraymut_push_str(
        self, p: UnsafePointer[JArrayMut], value: DiplomatStringView
    ) -> None:
        return self._jarraymut_push_str(p, value)

    @always_inline
    fn jarraymut_push_value(
        self, p: UnsafePointer[JArrayMut], value: UnsafePointer[JValue]
    ) -> None:
        return self._jarraymut_push_value(p, value)

    @always_inline
    fn jarraymut_push_object(
        self, p: UnsafePointer[JArrayMut], value: UnsafePointer[JObject]
    ) -> None:
        return self._jarraymut_push_object(p, value)

    @always_inline
    fn jarraymut_push_array(
        self, p: UnsafePointer[JArrayMut], value: UnsafePointer[JArray]
    ) -> None:
        return self._jarraymut_push_array(p, value)

    @always_inline
    fn jarraymut_insert(
        self,
        p: UnsafePointer[JArrayMut],
        index: c_size_t,
        value: UnsafePointer[JValue],
    ) -> None:
        return self._jarraymut_insert(p, index, value)

    @always_inline
    fn jarraymut_pop(
        self, p: UnsafePointer[JArrayMut]
    ) -> UnsafePointer[JValue]:
        return self._jarraymut_pop(p)

    @always_inline
    fn jarraymut_len(self, p: UnsafePointer[JArrayMut]) -> c_size_t:
        return self._jarraymut_len(p)

    @always_inline
    fn jarraymut_is_empty(self, p: UnsafePointer[JArrayMut]) -> c_bool:
        return self._jarraymut_is_empty(p)

    @always_inline
    fn jarraymut_clear(self, p: UnsafePointer[JArrayMut]) -> None:
        return self._jarraymut_clear(p)

    @always_inline
    fn jarraymut_remove(
        self, p: UnsafePointer[JArrayMut], index: c_size_t
    ) -> None:
        return self._jarraymut_remove(p, index)

    @always_inline
    fn jarraymut_get(
        self, p: UnsafePointer[JArrayMut], index: c_size_t
    ) -> UnsafePointer[JValueRef]:
        return self._jarraymut_get(p, index)

    @always_inline
    fn jarraymut_get_mut(
        self, p: UnsafePointer[JArrayMut], index: c_size_t
    ) -> UnsafePointer[JValueMut]:
        return self._jarraymut_get_mut(p, index)

    @always_inline
    fn jarraymut_iter(
        self, p: UnsafePointer[JArrayMut]
    ) -> UnsafePointer[JValueIter]:
        return self._jarraymut_iter(p)

    @always_inline
    fn jarraymut_iter_mut(
        self, p: UnsafePointer[JArrayMut]
    ) -> UnsafePointer[JValueIterMut]:
        return self._jarraymut_iter_mut(p)

    @always_inline
    fn jarraymut_destroy(self, p: UnsafePointer[JArrayMut]) -> None:
        return self._jarraymut_destroy(p)

    @always_inline
    fn jarrayref_clone(
        self, p: UnsafePointer[JArrayRef]
    ) -> UnsafePointer[JArray]:
        return self._jarrayref_clone(p)

    @always_inline
    fn jarrayref_to_string(
        self, p: UnsafePointer[JArrayRef], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jarrayref_to_string(p, write)

    @always_inline
    fn jarrayref_len(self, p: UnsafePointer[JArrayRef]) -> c_size_t:
        return self._jarrayref_len(p)

    @always_inline
    fn jarrayref_is_empty(self, p: UnsafePointer[JArrayRef]) -> c_bool:
        return self._jarrayref_is_empty(p)

    @always_inline
    fn jarrayref_get(
        self, p: UnsafePointer[JArrayRef], index: c_size_t
    ) -> UnsafePointer[JValueRef]:
        return self._jarrayref_get(p, index)

    @always_inline
    fn jarrayref_iter(
        self, p: UnsafePointer[JArrayRef]
    ) -> UnsafePointer[JValueIter]:
        return self._jarrayref_iter(p)

    @always_inline
    fn jarrayref_destroy(self, p: UnsafePointer[JArrayRef]) -> None:
        return self._jarrayref_destroy(p)

    @always_inline
    fn jkeysiter_next(
        self, p: UnsafePointer[JKeysIter], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jkeysiter_next(p, write)

    @always_inline
    fn jkeysiter_len(self, p: UnsafePointer[JKeysIter]) -> c_size_t:
        return self._jkeysiter_len(p)

    @always_inline
    fn jkeysiter_get(
        self,
        p: UnsafePointer[JKeysIter],
        index: c_size_t,
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jkeysiter_get(p, index, default, write)

    @always_inline
    fn jkeysiter_destroy(self, p: UnsafePointer[JKeysIter]) -> None:
        return self._jkeysiter_destroy(p)

    @always_inline
    fn jkeyvaluemut_get_key(
        self,
        p: UnsafePointer[JKeyValueMut],
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jkeyvaluemut_get_key(p, write)

    @always_inline
    fn jkeyvaluemut_get_value_mut(
        self, p: UnsafePointer[JKeyValueMut]
    ) -> UnsafePointer[JValueMut]:
        return self._jkeyvaluemut_get_value_mut(p)

    @always_inline
    fn jkeyvaluemut_destroy(self, p: UnsafePointer[JKeyValueMut]) -> None:
        return self._jkeyvaluemut_destroy(p)

    @always_inline
    fn jkeyvalueref_get_key(
        self,
        p: UnsafePointer[JKeyValueRef],
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jkeyvalueref_get_key(p, write)

    @always_inline
    fn jkeyvalueref_get_value(
        self, p: UnsafePointer[JKeyValueRef]
    ) -> UnsafePointer[JValueRef]:
        return self._jkeyvalueref_get_value(p)

    @always_inline
    fn jkeyvalueref_destroy(self, p: UnsafePointer[JKeyValueRef]) -> None:
        return self._jkeyvalueref_destroy(p)

    @always_inline
    fn jobject_new(self) -> UnsafePointer[JObject]:
        return self._jobject_new()

    @always_inline
    fn jobject_with_capacity(
        self, capacity: c_size_t
    ) -> UnsafePointer[JObject]:
        return self._jobject_with_capacity(capacity)

    @always_inline
    fn jobject_from_str(self, s: DiplomatStringView) -> UnsafePointer[JObject]:
        return self._jobject_from_str(s)

    @always_inline
    fn jobject_clone(self, p: UnsafePointer[JObject]) -> UnsafePointer[JObject]:
        return self._jobject_clone(p)

    @always_inline
    fn jobject_to_string(
        self, p: UnsafePointer[JObject], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jobject_to_string(p, write)

    @always_inline
    fn jobject_clear(self, p: UnsafePointer[JObject]) -> None:
        return self._jobject_clear(p)

    @always_inline
    fn jobject_capacity(self, p: UnsafePointer[JObject]) -> c_size_t:
        return self._jobject_capacity(p)

    @always_inline
    fn jobject_contains_key(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> c_bool:
        return self._jobject_contains_key(p, key)

    @always_inline
    fn jobject_insert_null(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> None:
        return self._jobject_insert_null(p, key)

    @always_inline
    fn jobject_insert_bool(
        self, p: UnsafePointer[JObject], key: DiplomatStringView, value: c_bool
    ) -> None:
        return self._jobject_insert_bool(p, key, value)

    @always_inline
    fn jobject_insert_i64(
        self, p: UnsafePointer[JObject], key: DiplomatStringView, value: c_int64
    ) -> None:
        return self._jobject_insert_i64(p, key, value)

    @always_inline
    fn jobject_insert_u64(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        value: c_uint64,
    ) -> None:
        return self._jobject_insert_u64(p, key, value)

    @always_inline
    fn jobject_insert_f64(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        value: c_double,
    ) -> None:
        return self._jobject_insert_f64(p, key, value)

    @always_inline
    fn jobject_insert_str(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        value: DiplomatStringView,
    ) -> None:
        return self._jobject_insert_str(p, key, value)

    @always_inline
    fn jobject_insert_value(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        value: UnsafePointer[JValue],
    ) -> None:
        return self._jobject_insert_value(p, key, value)

    @always_inline
    fn jobject_insert_object(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        value: UnsafePointer[JObject],
    ) -> None:
        return self._jobject_insert_object(p, key, value)

    @always_inline
    fn jobject_insert_array(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        value: UnsafePointer[JArray],
    ) -> None:
        return self._jobject_insert_array(p, key, value)

    @always_inline
    fn jobject_remove(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> c_bool:
        return self._jobject_remove(p, key)

    @always_inline
    fn jobject_len(self, p: UnsafePointer[JObject]) -> c_size_t:
        return self._jobject_len(p)

    @always_inline
    fn jobject_is_empty(self, p: UnsafePointer[JObject]) -> c_bool:
        return self._jobject_is_empty(p)

    @always_inline
    fn jobject_get_value(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JValue]:
        return self._jobject_get_value(p, key)

    @always_inline
    fn jobject_get_value_ref(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JValueRef]:
        return self._jobject_get_value_ref(p, key)

    @always_inline
    fn jobject_get_object_ref(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JObjectRef]:
        return self._jobject_get_object_ref(p, key)

    @always_inline
    fn jobject_get_array_ref(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JArrayRef]:
        return self._jobject_get_array_ref(p, key)

    @always_inline
    fn jobject_get_value_mut(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JValueMut]:
        return self._jobject_get_value_mut(p, key)

    @always_inline
    fn jobject_get_object_mut(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JObjectMut]:
        return self._jobject_get_object_mut(p, key)

    @always_inline
    fn jobject_get_array_mut(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> UnsafePointer[JArrayMut]:
        return self._jobject_get_array_mut(p, key)

    @always_inline
    fn jobject_get_bool(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        default: c_bool,
    ) -> c_bool:
        return self._jobject_get_bool(p, key, default)

    @always_inline
    fn jobject_get_i64(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> OptionI64Result:
        return self._jobject_get_i64(p, key)

    @always_inline
    fn jobject_get_u64(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> OptionU64Result:
        return self._jobject_get_u64(p, key)

    @always_inline
    fn jobject_get_f64(
        self, p: UnsafePointer[JObject], key: DiplomatStringView
    ) -> OptionF64Result:
        return self._jobject_get_f64(p, key)

    @always_inline
    fn jobject_get_str(
        self,
        p: UnsafePointer[JObject],
        key: DiplomatStringView,
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jobject_get_str(p, key, default, write)

    @always_inline
    fn jobject_keys_iter(
        self, p: UnsafePointer[JObject]
    ) -> UnsafePointer[JKeysIter]:
        return self._jobject_keys_iter(p)

    @always_inline
    fn jobject_iter(
        self, p: UnsafePointer[JObject]
    ) -> UnsafePointer[JObjectIter]:
        return self._jobject_iter(p)

    @always_inline
    fn jobject_iter_mut(
        self, p: UnsafePointer[JObject]
    ) -> UnsafePointer[JObjectIterMut]:
        return self._jobject_iter_mut(p)

    @always_inline
    fn jobject_destroy(self, p: UnsafePointer[JObject]) -> None:
        return self._jobject_destroy(p)

    @always_inline
    fn jobjectiter_next(
        self, p: UnsafePointer[JObjectIter]
    ) -> UnsafePointer[JKeyValueRef]:
        return self._jobjectiter_next(p)

    @always_inline
    fn jobjectiter_destroy(self, p: UnsafePointer[JObjectIter]) -> None:
        return self._jobjectiter_destroy(p)

    @always_inline
    fn jobjectitermut_next(
        self, p: UnsafePointer[JObjectIterMut]
    ) -> UnsafePointer[JKeyValueMut]:
        return self._jobjectitermut_next(p)

    @always_inline
    fn jobjectitermut_destroy(self, p: UnsafePointer[JObjectIterMut]) -> None:
        return self._jobjectitermut_destroy(p)

    @always_inline
    fn jobjectmut_clone(
        self, p: UnsafePointer[JObjectMut]
    ) -> UnsafePointer[JObject]:
        return self._jobjectmut_clone(p)

    @always_inline
    fn jobjectmut_to_string(
        self, p: UnsafePointer[JObjectMut], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jobjectmut_to_string(p, write)

    @always_inline
    fn jobjectmut_clear(self, p: UnsafePointer[JObjectMut]) -> None:
        return self._jobjectmut_clear(p)

    @always_inline
    fn jobjectmut_capacity(self, p: UnsafePointer[JObjectMut]) -> c_size_t:
        return self._jobjectmut_capacity(p)

    @always_inline
    fn jobjectmut_contains_key(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> c_bool:
        return self._jobjectmut_contains_key(p, key)

    @always_inline
    fn jobjectmut_insert_null(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> None:
        return self._jobjectmut_insert_null(p, key)

    @always_inline
    fn jobjectmut_insert_bool(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: c_bool,
    ) -> None:
        return self._jobjectmut_insert_bool(p, key, value)

    @always_inline
    fn jobjectmut_insert_i64(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: c_int64,
    ) -> None:
        return self._jobjectmut_insert_i64(p, key, value)

    @always_inline
    fn jobjectmut_insert_u64(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: c_uint64,
    ) -> None:
        return self._jobjectmut_insert_u64(p, key, value)

    @always_inline
    fn jobjectmut_insert_f64(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: c_double,
    ) -> None:
        return self._jobjectmut_insert_f64(p, key, value)

    @always_inline
    fn jobjectmut_insert_str(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: DiplomatStringView,
    ) -> None:
        return self._jobjectmut_insert_str(p, key, value)

    @always_inline
    fn jobjectmut_insert_value(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: UnsafePointer[JValue],
    ) -> None:
        return self._jobjectmut_insert_value(p, key, value)

    @always_inline
    fn jobjectmut_insert_object(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: UnsafePointer[JObject],
    ) -> None:
        return self._jobjectmut_insert_object(p, key, value)

    @always_inline
    fn jobjectmut_insert_array(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        value: UnsafePointer[JArray],
    ) -> None:
        return self._jobjectmut_insert_array(p, key, value)

    @always_inline
    fn jobjectmut_remove(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> c_bool:
        return self._jobjectmut_remove(p, key)

    @always_inline
    fn jobjectmut_len(self, p: UnsafePointer[JObjectMut]) -> c_size_t:
        return self._jobjectmut_len(p)

    @always_inline
    fn jobjectmut_is_empty(self, p: UnsafePointer[JObjectMut]) -> c_bool:
        return self._jobjectmut_is_empty(p)

    @always_inline
    fn jobjectmut_get_value(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> UnsafePointer[JValue]:
        return self._jobjectmut_get_value(p, key)

    @always_inline
    fn jobjectmut_get_value_ref(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> UnsafePointer[JValueRef]:
        return self._jobjectmut_get_value_ref(p, key)

    @always_inline
    fn jobjectmut_get_value_mut(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> UnsafePointer[JValueMut]:
        return self._jobjectmut_get_value_mut(p, key)

    @always_inline
    fn jobjectmut_get_object_mut(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> UnsafePointer[JObjectMut]:
        return self._jobjectmut_get_object_mut(p, key)

    @always_inline
    fn jobjectmut_get_array_mut(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> UnsafePointer[JArrayMut]:
        return self._jobjectmut_get_array_mut(p, key)

    @always_inline
    fn jobjectmut_get_bool(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        default: c_bool,
    ) -> c_bool:
        return self._jobjectmut_get_bool(p, key, default)

    @always_inline
    fn jobjectmut_get_i64(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> OptionI64Result:
        return self._jobjectmut_get_i64(p, key)

    @always_inline
    fn jobjectmut_get_u64(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> OptionU64Result:
        return self._jobjectmut_get_u64(p, key)

    @always_inline
    fn jobjectmut_get_f64(
        self, p: UnsafePointer[JObjectMut], key: DiplomatStringView
    ) -> OptionF64Result:
        return self._jobjectmut_get_f64(p, key)

    @always_inline
    fn jobjectmut_get_str(
        self,
        p: UnsafePointer[JObjectMut],
        key: DiplomatStringView,
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jobjectmut_get_str(p, key, default, write)

    @always_inline
    fn jobjectmut_keys_iter(
        self, p: UnsafePointer[JObjectMut]
    ) -> UnsafePointer[JKeysIter]:
        return self._jobjectmut_keys_iter(p)

    @always_inline
    fn jobjectmut_iter(
        self, p: UnsafePointer[JObjectMut]
    ) -> UnsafePointer[JObjectIter]:
        return self._jobjectmut_iter(p)

    @always_inline
    fn jobjectmut_destroy(self, p: UnsafePointer[JObjectMut]) -> None:
        return self._jobjectmut_destroy(p)

    @always_inline
    fn jobjectref_clone(
        self, p: UnsafePointer[JObjectRef]
    ) -> UnsafePointer[JObject]:
        return self._jobjectref_clone(p)

    @always_inline
    fn jobjectref_to_string(
        self, p: UnsafePointer[JObjectRef], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jobjectref_to_string(p, write)

    @always_inline
    fn jobjectref_capacity(self, p: UnsafePointer[JObjectRef]) -> c_size_t:
        return self._jobjectref_capacity(p)

    @always_inline
    fn jobjectref_contains_key(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> c_bool:
        return self._jobjectref_contains_key(p, key)

    @always_inline
    fn jobjectref_len(self, p: UnsafePointer[JObjectRef]) -> c_size_t:
        return self._jobjectref_len(p)

    @always_inline
    fn jobjectref_is_empty(self, p: UnsafePointer[JObjectRef]) -> c_bool:
        return self._jobjectref_is_empty(p)

    @always_inline
    fn jobjectref_get_value(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> UnsafePointer[JValue]:
        return self._jobjectref_get_value(p, key)

    @always_inline
    fn jobjectref_get_value_ref(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> UnsafePointer[JValueRef]:
        return self._jobjectref_get_value_ref(p, key)

    @always_inline
    fn jobjectref_get_object_ref(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> UnsafePointer[JObjectRef]:
        return self._jobjectref_get_object_ref(p, key)

    @always_inline
    fn jobjectref_get_array_ref(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> UnsafePointer[JArrayRef]:
        return self._jobjectref_get_array_ref(p, key)

    @always_inline
    fn jobjectref_get_bool(
        self,
        p: UnsafePointer[JObjectRef],
        key: DiplomatStringView,
        default: c_bool,
    ) -> c_bool:
        return self._jobjectref_get_bool(p, key, default)

    @always_inline
    fn jobjectref_get_i64(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> OptionI64Result:
        return self._jobjectref_get_i64(p, key)

    @always_inline
    fn jobjectref_get_u64(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> OptionU64Result:
        return self._jobjectref_get_u64(p, key)

    @always_inline
    fn jobjectref_get_f64(
        self, p: UnsafePointer[JObjectRef], key: DiplomatStringView
    ) -> OptionF64Result:
        return self._jobjectref_get_f64(p, key)

    @always_inline
    fn jobjectref_get_str(
        self,
        p: UnsafePointer[JObjectRef],
        key: DiplomatStringView,
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jobjectref_get_str(p, key, default, write)

    @always_inline
    fn jobjectref_keys_iter(
        self, p: UnsafePointer[JObjectRef]
    ) -> UnsafePointer[JKeysIter]:
        return self._jobjectref_keys_iter(p)

    @always_inline
    fn jobjectref_iter(
        self, p: UnsafePointer[JObjectRef]
    ) -> UnsafePointer[JObjectIter]:
        return self._jobjectref_iter(p)

    @always_inline
    fn jobjectref_destroy(self, p: UnsafePointer[JObjectRef]) -> None:
        return self._jobjectref_destroy(p)

    @always_inline
    fn jvalue_new(self) -> UnsafePointer[JValue]:
        return self._jvalue_new()

    @always_inline
    fn jvalue_new_bool(self, value: c_bool) -> UnsafePointer[JValue]:
        return self._jvalue_new_bool(value)

    @always_inline
    fn jvalue_new_i64(self, value: c_int64) -> UnsafePointer[JValue]:
        return self._jvalue_new_i64(value)

    @always_inline
    fn jvalue_new_u64(self, value: c_uint64) -> UnsafePointer[JValue]:
        return self._jvalue_new_u64(value)

    @always_inline
    fn jvalue_new_f64(self, value: c_double) -> UnsafePointer[JValue]:
        return self._jvalue_new_f64(value)

    @always_inline
    fn jvalue_new_str(self, value: DiplomatStringView) -> UnsafePointer[JValue]:
        return self._jvalue_new_str(value)

    @always_inline
    fn jvalue_from_str(self, s: DiplomatStringView) -> UnsafePointer[JValue]:
        return self._jvalue_from_str(s)

    @always_inline
    fn jvalue_clone(self, p: UnsafePointer[JValue]) -> UnsafePointer[JValue]:
        return self._jvalue_clone(p)

    @always_inline
    fn jvalue_get_type(self, p: UnsafePointer[JValue]) -> JsonType:
        return self._jvalue_get_type(p)

    @always_inline
    fn jvalue_is_boolean(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_boolean(p)

    @always_inline
    fn jvalue_is_true(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_true(p)

    @always_inline
    fn jvalue_is_false(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_false(p)

    @always_inline
    fn jvalue_is_null(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_null(p)

    @always_inline
    fn jvalue_is_number(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_number(p)

    @always_inline
    fn jvalue_is_str(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_str(p)

    @always_inline
    fn jvalue_is_array(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_array(p)

    @always_inline
    fn jvalue_is_object(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_object(p)

    @always_inline
    fn jvalue_is_f64(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_f64(p)

    @always_inline
    fn jvalue_is_i64(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_i64(p)

    @always_inline
    fn jvalue_is_u64(self, p: UnsafePointer[JValue]) -> c_bool:
        return self._jvalue_is_u64(p)

    @always_inline
    fn jvalue_as_bool(self, p: UnsafePointer[JValue]) -> OptionBoolResult:
        return self._jvalue_as_bool(p)

    @always_inline
    fn jvalue_as_i64(self, p: UnsafePointer[JValue]) -> OptionI64Result:
        return self._jvalue_as_i64(p)

    @always_inline
    fn jvalue_as_u64(self, p: UnsafePointer[JValue]) -> OptionU64Result:
        return self._jvalue_as_u64(p)

    @always_inline
    fn jvalue_as_f64(self, p: UnsafePointer[JValue]) -> OptionF64Result:
        return self._jvalue_as_f64(p)

    @always_inline
    fn jvalue_as_str(
        self,
        p: UnsafePointer[JValue],
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jvalue_as_str(p, default, write)

    @always_inline
    fn jvalue_as_object(
        self, p: UnsafePointer[JValue]
    ) -> UnsafePointer[JObject]:
        return self._jvalue_as_object(p)

    @always_inline
    fn jvalue_as_object_mut(
        self, p: UnsafePointer[JValue]
    ) -> UnsafePointer[JObjectMut]:
        return self._jvalue_as_object_mut(p)

    @always_inline
    fn jvalue_as_array(self, p: UnsafePointer[JValue]) -> UnsafePointer[JArray]:
        return self._jvalue_as_array(p)

    @always_inline
    fn jvalue_as_array_mut(
        self, p: UnsafePointer[JValue]
    ) -> UnsafePointer[JArrayMut]:
        return self._jvalue_as_array_mut(p)

    @always_inline
    fn jvalue_to_string(
        self, p: UnsafePointer[JValue], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jvalue_to_string(p, write)

    @always_inline
    fn jvalue_destroy(self, p: UnsafePointer[JValue]) -> None:
        return self._jvalue_destroy(p)

    @always_inline
    fn jvalueiter_len(self, p: UnsafePointer[JValueIter]) -> c_size_t:
        return self._jvalueiter_len(p)

    @always_inline
    fn jvalueiter_next(
        self, p: UnsafePointer[JValueIter]
    ) -> UnsafePointer[JValueRef]:
        return self._jvalueiter_next(p)

    @always_inline
    fn jvalueiter_destroy(self, p: UnsafePointer[JValueIter]) -> None:
        return self._jvalueiter_destroy(p)

    @always_inline
    fn jvalueitermut_len(self, p: UnsafePointer[JValueIterMut]) -> c_size_t:
        return self._jvalueitermut_len(p)

    @always_inline
    fn jvalueitermut_next(
        self, p: UnsafePointer[JValueIterMut]
    ) -> UnsafePointer[JValueMut]:
        return self._jvalueitermut_next(p)

    @always_inline
    fn jvalueitermut_destroy(self, p: UnsafePointer[JValueIterMut]) -> None:
        return self._jvalueitermut_destroy(p)

    @always_inline
    fn jvaluemut_clone(
        self, p: UnsafePointer[JValueMut]
    ) -> UnsafePointer[JValue]:
        return self._jvaluemut_clone(p)

    @always_inline
    fn jvaluemut_get_type(self, p: UnsafePointer[JValueMut]) -> JsonType:
        return self._jvaluemut_get_type(p)

    @always_inline
    fn jvaluemut_is_boolean(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_boolean(p)

    @always_inline
    fn jvaluemut_is_true(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_true(p)

    @always_inline
    fn jvaluemut_is_false(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_false(p)

    @always_inline
    fn jvaluemut_is_null(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_null(p)

    @always_inline
    fn jvaluemut_is_number(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_number(p)

    @always_inline
    fn jvaluemut_is_str(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_str(p)

    @always_inline
    fn jvaluemut_is_array(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_array(p)

    @always_inline
    fn jvaluemut_is_object(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_object(p)

    @always_inline
    fn jvaluemut_is_f64(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_f64(p)

    @always_inline
    fn jvaluemut_is_i64(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_i64(p)

    @always_inline
    fn jvaluemut_is_u64(self, p: UnsafePointer[JValueMut]) -> c_bool:
        return self._jvaluemut_is_u64(p)

    @always_inline
    fn jvaluemut_as_bool(self, p: UnsafePointer[JValueMut]) -> OptionBoolResult:
        return self._jvaluemut_as_bool(p)

    @always_inline
    fn jvaluemut_as_i64(self, p: UnsafePointer[JValueMut]) -> OptionI64Result:
        return self._jvaluemut_as_i64(p)

    @always_inline
    fn jvaluemut_as_u64(self, p: UnsafePointer[JValueMut]) -> OptionU64Result:
        return self._jvaluemut_as_u64(p)

    @always_inline
    fn jvaluemut_as_f64(self, p: UnsafePointer[JValueMut]) -> OptionF64Result:
        return self._jvaluemut_as_f64(p)

    @always_inline
    fn jvaluemut_as_str(
        self,
        p: UnsafePointer[JValueMut],
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jvaluemut_as_str(p, default, write)

    @always_inline
    fn jvaluemut_as_object_mut(
        self, p: UnsafePointer[JValueMut]
    ) -> UnsafePointer[JObjectMut]:
        return self._jvaluemut_as_object_mut(p)

    @always_inline
    fn jvaluemut_as_array_mut(
        self, p: UnsafePointer[JValueMut]
    ) -> UnsafePointer[JArrayMut]:
        return self._jvaluemut_as_array_mut(p)

    @always_inline
    fn jvaluemut_to_string(
        self, p: UnsafePointer[JValueMut], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jvaluemut_to_string(p, write)

    @always_inline
    fn jvaluemut_destroy(self, p: UnsafePointer[JValueMut]) -> None:
        return self._jvaluemut_destroy(p)

    @always_inline
    fn jvalueref_clone(
        self, p: UnsafePointer[JValueRef]
    ) -> UnsafePointer[JValue]:
        return self._jvalueref_clone(p)

    @always_inline
    fn jvalueref_get_type(self, p: UnsafePointer[JValueRef]) -> JsonType:
        return self._jvalueref_get_type(p)

    @always_inline
    fn jvalueref_is_true(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_true(p)

    @always_inline
    fn jvalueref_is_false(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_false(p)

    @always_inline
    fn jvalueref_is_i64(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_i64(p)

    @always_inline
    fn jvalueref_is_u64(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_u64(p)

    @always_inline
    fn jvalueref_is_f64(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_f64(p)

    @always_inline
    fn jvalueref_is_str(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_str(p)

    @always_inline
    fn jvalueref_is_object(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_object(p)

    @always_inline
    fn jvalueref_is_array(self, p: UnsafePointer[JValueRef]) -> c_bool:
        return self._jvalueref_is_array(p)

    @always_inline
    fn jvalueref_as_bool(self, p: UnsafePointer[JValueRef]) -> OptionBoolResult:
        return self._jvalueref_as_bool(p)

    @always_inline
    fn jvalueref_as_i64(self, p: UnsafePointer[JValueRef]) -> OptionI64Result:
        return self._jvalueref_as_i64(p)

    @always_inline
    fn jvalueref_as_u64(self, p: UnsafePointer[JValueRef]) -> OptionU64Result:
        return self._jvalueref_as_u64(p)

    @always_inline
    fn jvalueref_as_f64(self, p: UnsafePointer[JValueRef]) -> OptionF64Result:
        return self._jvalueref_as_f64(p)

    @always_inline
    fn jvalueref_as_str(
        self,
        p: UnsafePointer[JValueRef],
        default: DiplomatStringView,
        write: UnsafePointer[DiplomatWrite],
    ) -> None:
        return self._jvalueref_as_str(p, default, write)

    @always_inline
    fn jvalueref_as_object(
        self, p: UnsafePointer[JValueRef]
    ) -> UnsafePointer[JObject]:
        return self._jvalueref_as_object(p)

    @always_inline
    fn jvalueref_as_object_ref(
        self, p: UnsafePointer[JValueRef]
    ) -> UnsafePointer[JObjectRef]:
        return self._jvalueref_as_object_ref(p)

    @always_inline
    fn jvalueref_as_array(
        self, p: UnsafePointer[JValueRef]
    ) -> UnsafePointer[JArray]:
        return self._jvalueref_as_array(p)

    @always_inline
    fn jvalueref_as_array_ref(
        self, p: UnsafePointer[JValueRef]
    ) -> UnsafePointer[JArrayRef]:
        return self._jvalueref_as_array_ref(p)

    @always_inline
    fn jvalueref_to_string(
        self, p: UnsafePointer[JValueRef], write: UnsafePointer[DiplomatWrite]
    ) -> None:
        return self._jvalueref_to_string(p, write)

    @always_inline
    fn jvalueref_destroy(self, p: UnsafePointer[JValueRef]) -> None:
        return self._jvalueref_destroy(p)

from memory import UnsafePointer
from .internal import *
from .value_ref import JsonValueRef
from .value_mut import JsonValueMut
from .internal.csonic_bind import _sonic_ptr


struct JsonArrayMut(Stringable):
    var _array: UnsafePointer[JArrayMut]

    @always_inline
    fn __init__(out self, value: UnsafePointer[JArrayMut]):
        self._array = value

    @always_inline
    fn __moveinit__(out self, owned other: JsonArrayMut):
        self._array = other._array

    @always_inline
    fn clone(self) -> JsonArray:
        return JsonArray(_sonic_ptr()[].jarraymut_clone(self._array))

    @always_inline
    fn __del__(owned self):
        _sonic_ptr()[].jarraymut_destroy(self._array)

    @always_inline
    fn push_null(self) -> None:
        _sonic_ptr()[].jarraymut_push_null(self._array)

    @always_inline
    fn push_bool(self, value: Bool) -> None:
        _sonic_ptr()[].jarraymut_push_bool(self._array, value)

    @always_inline
    fn push_i64(self, value: Int64) -> None:
        _sonic_ptr()[].jarraymut_push_i64(self._array, value)

    @always_inline
    fn push_u64(self, value: UInt64) -> None:
        _sonic_ptr()[].jarraymut_push_u64(self._array, value)

    @always_inline
    fn push_f64(self, value: Float64) -> None:
        _sonic_ptr()[].jarraymut_push_f64(self._array, value)

    @always_inline
    fn push_str(self, value: String) -> None:
        var value_ = String(value)
        var s_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=value_.unsafe_cstr_ptr().bitcast[Byte](), length=len(value_)
        )
        _sonic_ptr()[].jarraymut_push_str(self._array, s_ref)
        _ = value_^

    @always_inline
    fn push_value(self, value: JsonValue) -> None:
        _sonic_ptr()[].jarraymut_push_value(self._array, value._value)

    @always_inline
    fn push_object(self, value: JsonObject) -> None:
        _sonic_ptr()[].jarraymut_push_object(self._array, value._object)

    @always_inline
    fn push_array(self, value: JsonArray) -> None:
        _sonic_ptr()[].jarraymut_push_array(self._array, value._array)

    @always_inline
    fn insert(self, index: Int, value: JsonValue) -> None:
        _sonic_ptr()[].jarraymut_insert(self._array, index, value._value)

    @always_inline
    fn pop(self) -> JsonValue:
        return JsonValue(_sonic_ptr()[].jarraymut_pop(self._array))

    @always_inline
    fn len(self) -> Int:
        return _sonic_ptr()[].jarraymut_len(self._array)

    @always_inline
    fn is_empty(self) -> Bool:
        return _sonic_ptr()[].jarraymut_is_empty(self._array)

    @always_inline
    fn clear(self) -> None:
        _sonic_ptr()[].jarraymut_clear(self._array)

    @always_inline
    fn remove(self, index: Int) -> None:
        _sonic_ptr()[].jarraymut_remove(self._array, index)

    @always_inline
    fn get(self, index: Int) -> JsonValueRef:
        return JsonValueRef(_sonic_ptr()[].jarraymut_get(self._array, index))

    @always_inline
    fn get_bool(self, index: Int, default: Bool = False) -> Bool:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarraymut_get(self._array, index)
        var ret = sonic[].jvalueref_as_bool(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_i64(self, index: Int, default: Int64 = 0) -> Int64:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarraymut_get(self._array, index)
        var ret = sonic[].jvalueref_as_i64(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_u64(self, index: Int, default: UInt64 = 0) -> UInt64:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarraymut_get(self._array, index)
        var ret = sonic[].jvalueref_as_u64(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_f64(self, index: Int, default: Float64 = 0.0) -> Float64:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarraymut_get(self._array, index)
        var ret = sonic[].jvalueref_as_f64(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_str(self, index: Int, default: StaticString = "") -> String:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarraymut_get(self._array, index)
        var out = sonic[].diplomat_buffer_write_create(1024)
        sonic[].jvalueref_as_str(vref, default, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        sonic[].diplomat_buffer_write_destroy(out)
        sonic[].jvalueref_destroy(vref)
        return ret_str

    # @always_inline
    # fn get_str_ref(self, index: Int, default: StaticString = "") -> StringRef:
    #     var vref = jarraymut_get(self._array, index)
    #     var ret = jvalueref_as_str_ref(vref, default)
    #     jvalueref_destroy(vref)
    #     return ret

    @always_inline
    fn iter(self) -> ValueIter:
        return ValueIter(_sonic_ptr()[].jarraymut_iter(self._array))

    fn iter_mut(self) -> ValueIterMut:
        return ValueIterMut(_sonic_ptr()[].jarraymut_iter_mut(self._array))

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(cap)
        _ = sonic[].jarraymut_to_string(self._array, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(self)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        sonic[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn destroy(self) -> None:
        _sonic_ptr()[].jarraymut_destroy(self._array)

    fn __str__(self) -> String:
        return self.to_string()

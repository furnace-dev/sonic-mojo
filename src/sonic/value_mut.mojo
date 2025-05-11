from memory import UnsafePointer
from .internal import *
from .internal.csonic_bind import _sonic_ptr


struct JsonValueMut(Stringable):
    var _value: UnsafePointer[JValueMut]

    @always_inline
    fn __init__(out self, v: UnsafePointer[JValueMut]):
        self._value = v

    @always_inline
    fn __copyinit__(out self, other: JsonValueMut):
        self._value = other._value

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueMut):
        self._value = other._value

    @always_inline
    fn __del__(owned self):
        _sonic_ptr()[].jvaluemut_destroy(self._value)

    # @always_inline
    # fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
    #     return self._value.bitcast[JObject]()

    # @always_inline
    # fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
    #     return self._value.bitcast[JArray]()

    # @always_inline
    # fn mark_root(self) -> None:
    #     return jvaluemut_mark_root(self._value)

    @always_inline
    fn get_type(self) -> JsonType:
        return _sonic_ptr()[].jvaluemut_get_type(self._value)

    @always_inline
    fn is_null(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Null

    @always_inline
    fn is_bool(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Boolean

    @always_inline
    fn is_true(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_true(self._value)

    @always_inline
    fn is_false(self) -> Bool:
        return not self.is_true()

    @always_inline
    fn is_i64(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_i64(self._value)

    @always_inline
    fn is_u64(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_u64(self._value)

    @always_inline
    fn is_f64(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_f64(self._value)

    @always_inline
    fn is_str(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_str(self._value)

    @always_inline
    fn is_object(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_object(self._value)

    @always_inline
    fn is_array(self) -> Bool:
        return _sonic_ptr()[].jvaluemut_is_array(self._value)

    @always_inline
    fn as_bool(self, default: Bool = False) -> Bool:
        var ret = _sonic_ptr()[].jvaluemut_as_bool(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_i64(self, default: Int64 = 0) -> Int64:
        var ret = _sonic_ptr()[].jvaluemut_as_i64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_u64(self, default: UInt64 = 0) -> UInt64:
        var ret = _sonic_ptr()[].jvaluemut_as_u64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_f64(self, default: Float64 = 0.0) -> Float64:
        var ret = _sonic_ptr()[].jvaluemut_as_f64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_str[T: Stringable](self, default: T) -> String:
        var sonic = _sonic_ptr()
        var default_ = String(default)
        var default_sref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=default_.unsafe_cstr_ptr().bitcast[Byte](), length=len(default_)
        )
        var out = sonic[].diplomat_buffer_write_create(1024)
        sonic[].jvaluemut_as_str(self._value, default_sref, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var s = String(
            StringSlice[__origin_of(StaticConstantOrigin)](
                ptr=s_data.bitcast[Byte](), length=s_len
            )
        )
        sonic[].diplomat_buffer_write_destroy(out)
        _ = default_^
        return s

    @always_inline
    fn as_object_mut(self) -> JsonObjectMut:
        return JsonObjectMut(
            _sonic_ptr()[].jvaluemut_as_object_mut(self._value)
        )

    @always_inline
    fn as_array_mut(self) -> JsonArrayMut:
        return JsonArrayMut(_sonic_ptr()[].jvaluemut_as_array_mut(self._value))

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(cap)
        _ = _sonic_ptr()[].jvaluemut_to_string(self._value, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var s_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var s = String(s_ref)
        sonic[].diplomat_buffer_write_destroy(out)
        return s

    fn __str__(self) -> String:
        return self.to_string()

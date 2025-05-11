from memory import UnsafePointer
from .internal import *
from .value import *
from .internal.csonic_bind import _sonic_ptr


struct JsonArrayRef(Stringable):
    var _array: UnsafePointer[JArrayRef]

    @always_inline
    fn __init__(out self, value: UnsafePointer[JArrayRef]):
        self._array = value

    @always_inline
    fn __copyinit__(out self, other: JsonArrayRef):
        self._array = other._array

    @always_inline
    fn __moveinit__(out self, owned other: JsonArrayRef):
        self._array = other._array

    @always_inline
    fn __del__(owned self):
        _sonic_ptr()[].jarrayref_destroy(self._array)

    @always_inline
    fn len(self) -> Int:
        return _sonic_ptr()[].jarrayref_len(self._array)

    @always_inline
    fn is_empty(self) -> Bool:
        return _sonic_ptr()[].jarrayref_is_empty(self._array)

    @always_inline
    fn get(self, index: Int) -> JsonValueRef:
        return JsonValueRef(_sonic_ptr()[].jarrayref_get(self._array, index))

    @always_inline
    fn get_bool(self, index: Int, default: Bool = False) -> Bool:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarrayref_get(self._array, index)
        var ret = sonic[].jvalueref_as_bool(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_i64(self, index: Int, default: Int64 = 0) -> Int64:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarrayref_get(self._array, index)
        var ret = sonic[].jvalueref_as_i64(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_u64(self, index: Int, default: UInt64 = 0) -> UInt64:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarrayref_get(self._array, index)
        var ret = sonic[].jvalueref_as_u64(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_f64(self, index: Int, default: Float64 = 0.0) -> Float64:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarrayref_get(self._array, index)
        var ret = sonic[].jvalueref_as_f64(vref)
        sonic[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_str(self, index: Int, default: StaticString = "") -> String:
        var sonic = _sonic_ptr()
        var vref = sonic[].jarrayref_get(self._array, index)
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
    # fn get_str_ref(self, index: Int, default: StringRef = "") -> StringRef:
    #     var vref = jarrayref_get(self._array, index)
    #     var ret = jvalueref_as_str_ref(vref, default)
    #     jvalueref_destroy(vref)
    #     return ret

    @always_inline
    fn iter(self) -> ValueIter:
        return ValueIter(_sonic_ptr()[].jarrayref_iter(self._array))

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(cap)
        _ = sonic[].jarrayref_to_string(self._array, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        sonic[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn destroy(self) -> None:
        _sonic_ptr()[].jarrayref_destroy(self._array)

    fn __str__(self) -> String:
        return self.to_string()

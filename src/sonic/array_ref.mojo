from memory import UnsafePointer
from .internal import *
from .value import *


struct JsonArrayRef(Stringable):
    var _ctx: Pointer[CSonic, StaticConstantOrigin]
    var _array: UnsafePointer[JArrayRef]

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[CSonic, StaticConstantOrigin],
        value: UnsafePointer[JArrayRef],
    ):
        self._ctx = ctx
        self._array = value

    @always_inline
    fn __copyinit__(out self, other: JsonArrayRef):
        self._ctx = other._ctx
        self._array = other._array

    @always_inline
    fn __moveinit__(out self, owned other: JsonArrayRef):
        self._ctx = other._ctx
        self._array = other._array

    @always_inline
    fn __del__(owned self):
        self._ctx[].jarrayref_destroy(self._array)

    @always_inline
    fn len(self) -> Int:
        return self._ctx[].jarrayref_len(self._array)

    @always_inline
    fn is_empty(self) -> Bool:
        return self._ctx[].jarrayref_is_empty(self._array)

    @always_inline
    fn get(self, index: Int) -> JsonValueRef:
        return JsonValueRef(
            self._ctx, self._ctx[].jarrayref_get(self._array, index)
        )

    @always_inline
    fn get_bool(self, index: Int, default: Bool = False) -> Bool:
        var vref = self._ctx[].jarrayref_get(self._array, index)
        var ret = self._ctx[].jvalueref_as_bool(vref)
        self._ctx[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_i64(self, index: Int, default: Int64 = 0) -> Int64:
        var vref = self._ctx[].jarrayref_get(self._array, index)
        var ret = self._ctx[].jvalueref_as_i64(vref)
        self._ctx[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_u64(self, index: Int, default: UInt64 = 0) -> UInt64:
        var vref = self._ctx[].jarrayref_get(self._array, index)
        var ret = self._ctx[].jvalueref_as_u64(vref)
        self._ctx[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_f64(self, index: Int, default: Float64 = 0.0) -> Float64:
        var vref = self._ctx[].jarrayref_get(self._array, index)
        var ret = self._ctx[].jvalueref_as_f64(vref)
        self._ctx[].jvalueref_destroy(vref)
        if ret.is_ok:
            return ret.ok
        else:
            return default

    @always_inline
    fn get_str(self, index: Int, default: StaticString = "") -> String:
        var vref = self._ctx[].jarrayref_get(self._array, index)
        var out = self._ctx[].diplomat_buffer_write_create(1024)
        self._ctx[].jvalueref_as_str(vref, default, out)
        var s_data = self._ctx[].diplomat_buffer_write_get_bytes(out)
        var s_len = self._ctx[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        self._ctx[].diplomat_buffer_write_destroy(out)
        self._ctx[].jvalueref_destroy(vref)
        return ret_str

    @always_inline
    fn iter(self) -> ValueIter:
        return ValueIter(self._ctx, self._ctx[].jarrayref_iter(self._array))

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = self._ctx[].diplomat_buffer_write_create(cap)
        _ = self._ctx[].jarrayref_to_string(self._array, out)
        var s_data = self._ctx[].diplomat_buffer_write_get_bytes(out)
        var s_len = self._ctx[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        self._ctx[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn destroy(self) -> None:
        self._ctx[].jarrayref_destroy(self._array)

    fn __str__(self) -> String:
        return self.to_string()

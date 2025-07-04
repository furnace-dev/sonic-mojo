from memory import UnsafePointer
from .internal import *


trait JsonRefContainerTrait:
    fn as_jobject_pointer(self) -> UnsafePointer[JObjectRef]:
        pass

    fn as_jarray_pointer(self) -> UnsafePointer[JArrayRef]:
        pass


struct JsonValueRef(JsonRefContainerTrait, Stringable, Copyable, Movable):
    var _ctx: Pointer[SonicContext, StaticConstantOrigin]
    var _value: UnsafePointer[JValueRef]

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[SonicContext, StaticConstantOrigin],
        value: UnsafePointer[JValueRef],
    ):
        self._ctx = ctx
        self._value = value

    @always_inline
    fn __copyinit__(out self, value: JsonValueRef):
        self._ctx = value._ctx
        self._value = value._value

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueRef):
        self._ctx = other._ctx
        self._value = other._value

    @always_inline
    fn __del__(owned self):
        self._ctx[].jvalueref_destroy(self._value)

    @always_inline
    fn as_jobject_pointer(self) -> UnsafePointer[JObjectRef]:
        return self._value.bitcast[JObjectRef]()

    @always_inline
    fn as_jarray_pointer(self) -> UnsafePointer[JArrayRef]:
        return self._value.bitcast[JArrayRef]()

    @always_inline
    fn clone(self) -> JsonValue:
        return JsonValue(self._ctx, self._ctx[].jvalueref_clone(self._value))

    @always_inline
    fn get_type(self) -> JsonType:
        return self._ctx[].jvalueref_get_type(self._value)

    @always_inline
    fn is_null(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Null

    @always_inline
    fn is_bool(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Boolean

    @always_inline
    fn is_true(self) -> Bool:
        return self._ctx[].jvalueref_is_true(self._value)

    @always_inline
    fn is_false(self) -> Bool:
        return not self.is_true()

    @always_inline
    fn is_i64(self) -> Bool:
        return self._ctx[].jvalueref_is_i64(self._value)

    @always_inline
    fn is_u64(self) -> Bool:
        return self._ctx[].jvalueref_is_u64(self._value)

    @always_inline
    fn is_f64(self) -> Bool:
        return self._ctx[].jvalueref_is_f64(self._value)

    @always_inline
    fn is_str(self) -> Bool:
        return self._ctx[].jvalueref_is_str(self._value)

    @always_inline
    fn is_object(self) -> Bool:
        return self._ctx[].jvalueref_is_object(self._value)

    @always_inline
    fn is_array(self) -> Bool:
        return self._ctx[].jvalueref_is_array(self._value)

    @always_inline
    fn as_bool(self, default: Bool = False) -> Bool:
        var ret = self._ctx[].jvalueref_as_bool(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_i64(self, default: Int64 = 0) -> Int64:
        var ret = self._ctx[].jvalueref_as_i64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_u64(self, default: UInt64 = 0) -> UInt64:
        var ret = self._ctx[].jvalueref_as_u64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_f64(self, default: Float64 = 0.0) -> Float64:
        var ret = self._ctx[].jvalueref_as_f64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_str[T: Stringable](self, default: T) -> String:
        var default_ = String(default)
        var default_sref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=default_.unsafe_cstr_ptr().bitcast[Byte](), length=len(default_)
        )
        var out = self._ctx[].diplomat_buffer_write_create(1024)
        self._ctx[].jvalueref_as_str(self._value, default_sref, out)
        var s_data = self._ctx[].diplomat_buffer_write_get_bytes(out)
        var s_len = self._ctx[].diplomat_buffer_write_len(out)
        var s = String(
            StringSlice[__origin_of(StaticConstantOrigin)](
                ptr=s_data.bitcast[Byte](), length=s_len
            )
        )
        self._ctx[].diplomat_buffer_write_destroy(out)
        _ = default_^
        return s

    @always_inline
    fn as_object(self) -> JsonObject:
        var ret = self._ctx[].jvalueref_as_object(self._value)
        return JsonObject(self._ctx, ret)

    @always_inline
    fn as_object_ref(self) -> JsonObjectRef:
        var ret = self._ctx[].jvalueref_as_object_ref(self._value)
        return JsonObjectRef(self._ctx, ret)

    @always_inline
    fn as_array(self) -> JsonArray:
        var ret = self._ctx[].jvalueref_as_array(self._value)
        return JsonArray(self._ctx, ret)

    @always_inline
    fn as_array_ref(self) -> JsonArrayRef:
        var ret = self._ctx[].jvalueref_as_array_ref(self._value)
        return JsonArrayRef(self._ctx, ret)

    @always_inline
    fn to_string(self, cap: Int = 1024) -> String:
        var out = self._ctx[].diplomat_buffer_write_create(cap)
        _ = self._ctx[].jvalueref_to_string(self._value, out)
        var s_data = self._ctx[].diplomat_buffer_write_get_bytes(out)
        var s_len = self._ctx[].diplomat_buffer_write_len(out)
        var s_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var s = String(s_ref)
        self._ctx[].diplomat_buffer_write_destroy(out)
        return s

    fn __str__(self) -> String:
        return self.to_string()

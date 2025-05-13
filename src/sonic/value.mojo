from memory import UnsafePointer
from .internal import *


trait JsonContainerTrait:
    fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
        pass

    fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
        pass


trait JsonObjectViewable:
    fn to_string[cap: Int = 1024](self) -> String:
        pass

    fn capacity(self) -> Int:
        pass

    fn contains_key(self, key: StaticString) -> Bool:
        pass

    fn len(self) -> Int:
        pass

    fn is_empty(self) -> Bool:
        pass

    fn get_type(self) -> JsonType:
        pass

    fn get_value(self, key: StaticString) -> JsonValue:
        pass

    fn get_bool(self, key: StaticString, default: Bool = False) -> Bool:
        pass

    fn get_i64(self, key: StaticString, default: Int64 = 0) -> Int64:
        pass

    fn get_u64(self, key: StaticString, default: UInt64 = 0) -> UInt64:
        pass

    fn get_f64(self, key: StaticString, default: Float64 = 0.0) -> Float64:
        pass

    fn get_str(self, key: StaticString, default: StaticString = "") -> String:
        pass

    # fn get_str_ref(self, key: StaticString, default: StaticString = "") -> StringRef:
    #     pass

    fn keys(self) -> List[String]:
        pass

    fn iter(self) -> List[Tuple[String, JsonValueRef]]:
        pass


struct JsonValue(JsonContainerTrait, Stringable):
    var _ctx: Pointer[CSonic, StaticConstantOrigin]
    var _value: UnsafePointer[JValue]

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[CSonic, StaticConstantOrigin],
        v: UnsafePointer[JValue],
    ):
        self._ctx = ctx
        self._value = ctx[].jvalue_clone(v)

    @always_inline
    fn __init__(out self, ctx: Pointer[CSonic, StaticConstantOrigin]):
        self._ctx = ctx
        self._value = ctx[].jvalue_new()

    @always_inline
    fn __init__(out self, ctx: Pointer[CSonic, StaticConstantOrigin], b: Bool):
        self._ctx = ctx
        self._value = ctx[].jvalue_new_bool(b)

    @always_inline
    fn __init__(out self, ctx: Pointer[CSonic, StaticConstantOrigin], i64: Int):
        self._ctx = ctx
        self._value = ctx[].jvalue_new_i64(i64)

    @always_inline
    fn __init__(
        out self, ctx: Pointer[CSonic, StaticConstantOrigin], i64: Int64
    ):
        self._ctx = ctx
        self._value = ctx[].jvalue_new_i64(i64)

    @always_inline
    fn __init__(
        out self, ctx: Pointer[CSonic, StaticConstantOrigin], u64: UInt64
    ):
        self._ctx = ctx
        self._value = ctx[].jvalue_new_u64(u64)

    @always_inline
    fn __init__(
        out self, ctx: Pointer[CSonic, StaticConstantOrigin], f64: Float64
    ):
        self._ctx = ctx
        self._value = ctx[].jvalue_new_f64(f64)

    @always_inline
    fn __init__[
        T: Stringable
    ](out self, ctx: Pointer[CSonic, StaticConstantOrigin], s: T):
        self._ctx = ctx
        var s_ = String(s)
        var s_view = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_.unsafe_cstr_ptr().bitcast[Byte](), length=len(s_)
        )
        self._value = ctx[].jvalue_new_str(s_view)

    @always_inline
    fn __copyinit__(out self, other: JsonValue):
        self._ctx = other._ctx
        self._value = other._ctx[].jvalue_clone(other._value)

    @always_inline
    fn __moveinit__(out self, owned other: JsonValue):
        self._ctx = other._ctx
        self._value = other._value

    @staticmethod
    fn from_str[
        T: Stringable
    ](ctx: Pointer[CSonic, StaticConstantOrigin], s: T) -> JsonValue:
        var s_ = String(s)
        var s_view = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_.unsafe_cstr_ptr().bitcast[Byte](), length=len(s_)
        )
        return JsonValue(ctx, ctx[].jvalue_from_str(s_view))

    @always_inline
    fn __del__(owned self):
        self._ctx[].jvalue_destroy(self._value)

    @always_inline
    fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
        return self._value.bitcast[JObject]()

    @always_inline
    fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
        return self._value.bitcast[JArray]()

    @always_inline
    fn get_type(self) -> JsonType:
        return self._ctx[].jvalue_get_type(self._value)

    @always_inline
    fn is_null(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Null

    @always_inline
    fn is_bool(self) -> Bool:
        return self.get_type() == JsonType.JsonType_Boolean

    @always_inline
    fn is_true(self) -> Bool:
        return self._ctx[].jvalue_is_true(self._value)

    @always_inline
    fn is_false(self) -> Bool:
        return not self.is_true()

    @always_inline
    fn is_i64(self) -> Bool:
        return self._ctx[].jvalue_is_i64(self._value)

    @always_inline
    fn is_u64(self) -> Bool:
        return self._ctx[].jvalue_is_u64(self._value)

    @always_inline
    fn is_f64(self) -> Bool:
        return self._ctx[].jvalue_is_f64(self._value)

    @always_inline
    fn is_str(self) -> Bool:
        return self._ctx[].jvalue_is_str(self._value)

    @always_inline
    fn is_object(self) -> Bool:
        return self._ctx[].jvalue_is_object(self._value)

    @always_inline
    fn is_array(self) -> Bool:
        return self._ctx[].jvalue_is_array(self._value)

    @always_inline
    fn as_bool(self, default: Bool = False) -> Bool:
        var ret = self._ctx[].jvalue_as_bool(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_i64(self, default: Int64 = 0) -> Int64:
        var ret = self._ctx[].jvalue_as_i64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_u64(self, default: UInt64 = 0) -> UInt64:
        var ret = self._ctx[].jvalue_as_u64(self._value)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn as_f64(self, default: Float64 = 0.0) -> Float64:
        var ret = self._ctx[].jvalue_as_f64(self._value)
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
        self._ctx[].jvalue_as_str(self._value, default_sref, out)
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
    fn to_string(self, cap: Int = 1024) -> String:
        var out = self._ctx[].diplomat_buffer_write_create(cap)
        _ = self._ctx[].jvalue_to_string(self._value, out)
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


struct ValueIter:
    var _ctx: Pointer[CSonic, StaticConstantOrigin]
    var _iter: UnsafePointer[JValueIter]

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[CSonic, StaticConstantOrigin],
        value: UnsafePointer[JValueIter],
    ):
        self._ctx = ctx
        self._iter = value

    fn __del__(owned self):
        self._ctx[].jvalueiter_destroy(self._iter)

    fn len(self) -> Int:
        return self._ctx[].jvalueiter_len(self._iter)

    fn next(self) -> JsonValueRef:
        return JsonValueRef(self._ctx, self._ctx[].jvalueiter_next(self._iter))


struct ValueIterMut:
    var _ctx: Pointer[CSonic, StaticConstantOrigin]
    var _iter: UnsafePointer[JValueIterMut]

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[CSonic, StaticConstantOrigin],
        value: UnsafePointer[JValueIterMut],
    ):
        self._ctx = ctx
        self._iter = value

    fn __del__(owned self):
        self._ctx[].jvalueitermut_destroy(self._iter)

    fn len(self) -> Int:
        return self._ctx[].jvalueitermut_len(self._iter)

    fn next(self) -> JsonValueMut:
        return JsonValueMut(
            self._ctx, self._ctx[].jvalueitermut_next(self._iter)
        )

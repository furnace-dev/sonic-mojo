from memory import UnsafePointer
from .internal import *
from .value import JsonValue, JsonContainerTrait, JsonObjectViewable
from .value_ref import JsonValueRef


struct JsonValueObjectView[origin: MutableOrigin, T: JsonContainerTrait](
    Stringable, JsonObjectViewable
):
    var _ctx: Pointer[SonicContext, StaticConstantOrigin]
    var _src: Pointer[T, origin]
    var _object: UnsafePointer[JObject]

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[SonicContext, StaticConstantOrigin],
        ref [origin]value: T,
    ):
        self._ctx = ctx
        self._src = Pointer(to=value)
        self._object = value.as_jobject_pointer()

    @always_inline
    fn __init__(
        out self,
        ctx: Pointer[SonicContext, StaticConstantOrigin],
        value: Pointer[T, origin],
    ):
        self._ctx = ctx
        self._src = value
        self._object = value[].as_jobject_pointer()

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueObjectView[origin, T]):
        self._ctx = other._ctx
        self._src = other._src
        self._object = other._object

    @always_inline
    fn __del__(owned self):
        pass

    @always_inline
    fn to_string[cap: Int = 1024](self) -> String:
        var out = self._ctx[].diplomat_buffer_write_create(cap)
        _ = self._ctx[].jobject_to_string(self._object, out)
        var s_data = self._ctx[].diplomat_buffer_write_get_bytes(out)
        var s_len = self._ctx[].diplomat_buffer_write_len(out)
        var chars = stack_allocation[cap + 1, UInt8]()
        for i in range(s_len):
            chars[i] = s_data[i]
        chars[s_len] = 0  # 添加 null 终止符
        var ret_str = String(unsafe_from_utf8_ptr=chars)
        self._ctx[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn clear(self) -> None:
        return self._ctx[].jobject_clear(self._object)

    @always_inline
    fn capacity(self) -> Int:
        return self._ctx[].jobject_capacity(self._object)

    @always_inline
    fn contains_key(self, key: StaticString) -> Bool:
        return self._ctx[].jobject_contains_key(self._object, key)

    @always_inline
    fn insert_null(self, key: StaticString) -> None:
        return self._ctx[].jobject_insert_null(self._object, key)

    @always_inline
    fn insert_bool(self, key: StaticString, value: Bool) -> None:
        return self._ctx[].jobject_insert_bool(self._object, key, value)

    @always_inline
    fn insert_i64(self, key: StaticString, value: c_int64) -> None:
        return self._ctx[].jobject_insert_i64(self._object, key, value)

    @always_inline
    fn insert_u64(self, key: StaticString, value: c_uint64) -> None:
        return self._ctx[].jobject_insert_u64(self._object, key, value)

    @always_inline
    fn insert_f64(self, key: StaticString, value: c_double) -> None:
        return self._ctx[].jobject_insert_f64(self._object, key, value)

    @always_inline
    fn insert_str(self, key: StaticString, value: String) -> None:
        var value_ = String(value)
        var value_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=value_.unsafe_cstr_ptr().bitcast[Byte](), length=len(value_)
        )
        self._ctx[].jobject_insert_str(self._object, key, value_ref)
        _ = value_^

    @always_inline
    fn insert_value(self, key: StaticString, value: JsonValue) -> None:
        return self._ctx[].jobject_insert_value(self._object, key, value._value)

    @always_inline
    fn insert_array(self, key: StaticString, value: JsonArray) -> None:
        return self._ctx[].jobject_insert_array(self._object, key, value._array)

    @always_inline
    fn insert_object(self, key: StaticString, value: JsonObject) -> None:
        return self._ctx[].jobject_insert_object(
            self._object, key, value._object
        )

    @always_inline
    fn remove(self, key: StaticString) -> Bool:
        return self._ctx[].jobject_remove(self._object, key)

    @always_inline
    fn len(self) -> Int:
        return self._ctx[].jobject_len(self._object)

    @always_inline
    fn is_empty(self) -> Bool:
        return self._ctx[].jobject_is_empty(self._object)

    @always_inline
    fn destroy(self) -> None:
        return self._ctx[].jobject_destroy(self._object)

    @always_inline
    fn get_type(self) -> JsonType:
        return self._ctx[].jvalue_get_type(self._object.bitcast[JValue]())

    @always_inline
    fn get_value(self, key: StaticString) -> JsonValue:
        return JsonValue(
            self._ctx, self._ctx[].jobject_get_value(self._object, key)
        )

    @always_inline
    fn get_bool(self, key: StaticString, default: Bool = False) -> Bool:
        return self._ctx[].jobject_get_bool(self._object, key, default)

    @always_inline
    fn get_i64(self, key: StaticString, default: Int64 = 0) -> Int64:
        var ret = self._ctx[].jobject_get_i64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_u64(self, key: StaticString, default: UInt64 = 0) -> UInt64:
        var ret = self._ctx[].jobject_get_u64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_f64(self, key: StaticString, default: Float64 = 0.0) -> Float64:
        var ret = self._ctx[].jobject_get_f64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_str(self, key: StaticString, default: StaticString = "") -> String:
        var out = self._ctx[].diplomat_buffer_write_create(1024)
        self._ctx[].jobject_get_str(self._object, key, default, out)
        var s_data = self._ctx[].diplomat_buffer_write_get_bytes(out)
        var s_len = self._ctx[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        self._ctx[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn get_object_mut(self, key: StaticString) -> JsonObjectMut:
        var ret = self._ctx[].jobject_get_object_mut(self._object, key)
        return JsonObjectMut(self._ctx, ret)

    @always_inline
    fn get_array_mut(self, key: StaticString) -> JsonArrayMut:
        var ret = self._ctx[].jobject_get_array_mut(self._object, key)
        return JsonArrayMut(self._ctx, ret)

    fn keys(self) -> List[String]:
        var iter = self._ctx[].jobject_keys_iter(self._object)
        var len = self._ctx[].jobject_len(self._object)
        var ret = List[String](capacity=len)
        var default = StringSlice("")
        for i in range(len):
            var out = self._ctx[].diplomat_buffer_write_create(1024)
            self._ctx[].jkeysiter_get(iter, i, default, out)
            var key = self._ctx[].diplomat_buffer_write_get_bytes(out)
            var key_len = self._ctx[].diplomat_buffer_write_len(out)
            var key_ref = StringSlice[__origin_of(StaticConstantOrigin)](
                ptr=key.bitcast[Byte](), length=key_len
            )
            var key_str = String(key_ref)
            ret.append(key_str)
            self._ctx[].diplomat_buffer_write_destroy(out)
        self._ctx[].jkeysiter_destroy(iter)
        return ret

    fn iter(self) -> List[Tuple[String, JsonValueRef]]:
        var iter = self._ctx[].jobject_iter(self._object)
        var ret = List[Tuple[String, JsonValueRef]]()
        while True:
            var kv = self._ctx[].jobjectiter_next(iter)
            var out = self._ctx[].diplomat_buffer_write_create(1024)
            self._ctx[].jkeyvalueref_get_key(kv, out)
            var key = self._ctx[].diplomat_buffer_write_get_bytes(out)
            var key_len = self._ctx[].diplomat_buffer_write_len(out)
            var key_ref = StringSlice[__origin_of(StaticConstantOrigin)](
                ptr=key.bitcast[Byte](), length=key_len
            )
            var key_str = String(key_ref)
            self._ctx[].diplomat_buffer_write_destroy(out)
            if key_len == 0:
                self._ctx[].jkeyvalueref_destroy(kv)
                break
            var value = self._ctx[].jkeyvalueref_get_value(kv)
            var value_obj = JsonValueRef(self._ctx, value)
            ret.append((key_str, value_obj))
            self._ctx[].jkeyvalueref_destroy(kv)
        self._ctx[].jobjectiter_destroy(iter)
        return ret

    fn __str__(self) -> String:
        return self.to_string()

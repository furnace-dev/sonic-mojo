from memory import UnsafePointer, stack_allocation
from .internal import *
from .object_ref import *
from .internal.csonic_bind import _sonic_ptr


@always_inline
fn convert_jvalue_to_string(self: UnsafePointer[JValueRef]) -> String:
    var sonic = _sonic_ptr()
    var out = sonic[].diplomat_buffer_write_create(1024)
    sonic[].jvalueref_to_string(self, out)
    var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
    var s_len = sonic[].diplomat_buffer_write_len(out)
    var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
        ptr=s_data.bitcast[Byte](), length=s_len
    )
    var ret_str = String(ret_str_ref)
    sonic[].diplomat_buffer_write_destroy(out)
    return ret_str


struct JsonObject(JsonContainerTrait, JsonObjectViewable, Stringable):
    var _object: UnsafePointer[JObject]

    @always_inline
    fn __init__(out self):
        self._object = _sonic_ptr()[].jobject_new()

    @always_inline
    fn __init__[T: Stringable](out self, s: T):
        var s_ = String(s)
        var s_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_.unsafe_cstr_ptr().bitcast[Byte](), length=len(s_)
        )
        var v = _sonic_ptr()[].jvalue_from_str(s_ref)
        _ = s_^
        self._object = v.bitcast[JObject]()

    @always_inline
    fn __init__(out self, o: UnsafePointer[JObject]):
        self._object = o

    @always_inline
    fn __copyinit__(out self, other: JsonObject):
        self._object = _sonic_ptr()[].jobject_clone(other._object)

    @always_inline
    fn __moveinit__(out self, owned other: JsonObject):
        self._object = other._object

    @always_inline
    fn __del__(owned self):
        _sonic_ptr()[].jobject_destroy(self._object)

    @always_inline
    fn as_jobject_pointer(self) -> UnsafePointer[JObject]:
        return self._object

    @always_inline
    fn as_jarray_pointer(self) -> UnsafePointer[JArray]:
        return self._object.bitcast[JArray]()

    @always_inline
    fn to_string[cap: Int = 1024](self) -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(cap)
        _ = sonic[].jobject_to_string(self._object, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)

        # 创建一个新的字符数组并逐字节复制
        var chars = stack_allocation[cap + 1, UInt8]()
        for i in range(s_len):
            chars[i] = s_data[i]
        chars[s_len] = 0  # 添加 null 终止符

        var ret_str = String(unsafe_from_utf8_ptr=chars)
        sonic[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn clear(self) -> None:
        return _sonic_ptr()[].jobject_clear(self._object)

    @always_inline
    fn capacity(self) -> Int:
        return _sonic_ptr()[].jobject_capacity(self._object)

    @always_inline
    fn contains_key(self, key: StaticString) -> Bool:
        return _sonic_ptr()[].jobject_contains_key(self._object, key)

    @always_inline
    fn insert_null(self, key: StaticString) -> None:
        return _sonic_ptr()[].jobject_insert_null(self._object, key)

    @always_inline
    fn insert_bool(self, key: StaticString, value: Bool) -> None:
        return _sonic_ptr()[].jobject_insert_bool(self._object, key, value)

    @always_inline
    fn insert_i64(self, key: StaticString, value: c_int64) -> None:
        return _sonic_ptr()[].jobject_insert_i64(self._object, key, value)

    @always_inline
    fn insert_u64(self, key: StaticString, value: c_uint64) -> None:
        return _sonic_ptr()[].jobject_insert_u64(self._object, key, value)

    @always_inline
    fn insert_f64(self, key: StaticString, value: c_double) -> None:
        return _sonic_ptr()[].jobject_insert_f64(self._object, key, value)

    @always_inline
    fn insert_str[T: Stringable](self, key: StaticString, value: T) -> None:
        var value_ = String(value)
        var value_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=value_.unsafe_cstr_ptr().bitcast[Byte](), length=len(value_)
        )
        _sonic_ptr()[].jobject_insert_str(self._object, key, value_ref)
        _ = value_^

    @always_inline
    fn insert_value(self, key: StaticString, value: JsonValue) -> None:
        return _sonic_ptr()[].jobject_insert_value(
            self._object, key, value._value
        )

    @always_inline
    fn insert_array(self, key: StaticString, value: JsonArray) -> None:
        return _sonic_ptr()[].jobject_insert_array(
            self._object, key, value._array
        )

    @always_inline
    fn insert_object(self, key: StaticString, value: JsonObject) -> None:
        return _sonic_ptr()[].jobject_insert_object(
            self._object, key, value._object
        )

    @always_inline
    fn remove(self, key: StaticString) -> Bool:
        return _sonic_ptr()[].jobject_remove(self._object, key)

    @always_inline
    fn len(self) -> Int:
        return _sonic_ptr()[].jobject_len(self._object)

    @always_inline
    fn is_empty(self) -> Bool:
        return _sonic_ptr()[].jobject_is_empty(self._object)

    @always_inline
    fn destroy(self) -> None:
        return _sonic_ptr()[].jobject_destroy(self._object)

    @always_inline
    fn get_type(self) -> JsonType:
        return _sonic_ptr()[].jvalue_get_type(self._object.bitcast[JValue]())

    @always_inline
    fn get_value(self, key: StaticString) -> JsonValue:
        return JsonValue(_sonic_ptr()[].jobject_get_value(self._object, key))

    @always_inline
    fn get_bool(self, key: StaticString, default: Bool = False) -> Bool:
        return _sonic_ptr()[].jobject_get_bool(self._object, key, default)

    @always_inline
    fn get_i64(self, key: StaticString, default: Int64 = 0) -> Int64:
        var ret = _sonic_ptr()[].jobject_get_i64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_u64(self, key: StaticString, default: UInt64 = 0) -> UInt64:
        var ret = _sonic_ptr()[].jobject_get_u64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_f64(self, key: StaticString, default: Float64 = 0.0) -> Float64:
        var ret = _sonic_ptr()[].jobject_get_f64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_str(self, key: StaticString, default: StaticString = "") -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(1024)
        sonic[].jobject_get_str(self._object, key, default, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        sonic[].diplomat_buffer_write_destroy(out)
        return ret_str

    # @always_inline
    # fn get_str_ref(self, key: StringRef, default: StringRef = "") -> StringRef:
    #     return jobject_get_str_ref(self._object, key, default)

    @always_inline
    fn get_object_ref(self, key: StaticString) -> JsonObjectRef:
        var ret = _sonic_ptr()[].jobject_get_object_ref(self._object, key)
        return JsonObjectRef(ret)

    @always_inline
    fn get_object_mut(self, key: StaticString) -> JsonObjectMut:
        var ret = _sonic_ptr()[].jobject_get_object_mut(self._object, key)
        return JsonObjectMut(ret)

    @always_inline
    fn get_array_mut(self, key: StaticString) -> JsonArrayMut:
        var ret = _sonic_ptr()[].jobject_get_array_mut(self._object, key)
        return JsonArrayMut(ret)

    fn keys(self) -> List[String]:
        var sonic = _sonic_ptr()
        var iter = sonic[].jobject_keys_iter(self._object)
        var len = sonic[].jobject_len(self._object)
        var ret = List[String](capacity=len)
        var default = StringSlice("")
        for i in range(len):
            var out = sonic[].diplomat_buffer_write_create(1024)
            sonic[].jkeysiter_get(iter, i, default, out)
            var key = sonic[].diplomat_buffer_write_get_bytes(out)
            var key_len = sonic[].diplomat_buffer_write_len(out)
            var key_ref = StringSlice[__origin_of(StaticConstantOrigin)](
                ptr=key.bitcast[Byte](), length=key_len
            )
            var key_str = String(key_ref)
            ret.append(key_str)
            sonic[].diplomat_buffer_write_destroy(out)
        sonic[].jkeysiter_destroy(iter)
        return ret

    fn iter(self) -> List[Tuple[String, JsonValueRef]]:
        var sonic = _sonic_ptr()
        var iter = sonic[].jobject_iter(self._object)
        var ret = List[Tuple[String, JsonValueRef]]()
        while True:
            var kv = sonic[].jobjectiter_next(iter)
            var out = sonic[].diplomat_buffer_write_create(1024)
            sonic[].jkeyvalueref_get_key(kv, out)
            var key = sonic[].diplomat_buffer_write_get_bytes(out)
            var key_len = sonic[].diplomat_buffer_write_len(out)
            var key_ref = StringSlice[__origin_of(StaticConstantOrigin)](
                ptr=key.bitcast[Byte](), length=key_len
            )
            var key_str = String(key_ref)
            sonic[].diplomat_buffer_write_destroy(out)
            if key_len == 0:
                sonic[].jkeyvalueref_destroy(kv)
                break
            var value = sonic[].jkeyvalueref_get_value(kv)
            # var value_str = convert_jvalue_to_string(value)
            # print("y", value_str)
            var value_obj = JsonValueRef(value)
            ret.append((key_str, value_obj))
            sonic[].jkeyvalueref_destroy(kv)
        sonic[].jobjectiter_destroy(iter)
        return ret

    fn __str__(self) -> String:
        return self.to_string()

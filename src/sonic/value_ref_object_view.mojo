from memory import UnsafePointer
from collections.string import StringSlice, StaticString
from .internal import *
from .value import JsonValue, JsonContainerTrait, JsonObjectViewable
from .value_ref import JsonValueRef
from .internal.csonic_bind import _sonic_ptr


struct JsonValueRefObjectView[origin: MutableOrigin, T: JsonRefContainerTrait](
    JsonObjectViewable, Stringable
):
    var _src: Pointer[T, origin]
    var _object: UnsafePointer[JObjectRef]

    @always_inline
    fn __init__(out self, ref [origin]value: T):
        self._src = Pointer(to=value)
        self._object = value.as_jobject_pointer()

    @always_inline
    fn __init__(out self, value: Pointer[T, origin]):
        self._src = value
        self._object = value[].as_jobject_pointer()

    @always_inline
    fn __moveinit__(out self, owned other: JsonValueRefObjectView[origin, T]):
        self._src = other._src
        self._object = other._object

    @always_inline
    fn __del__(owned self):
        pass

    @always_inline
    fn to_string[cap: Int = 1024](self) -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(cap)
        _ = sonic[].jobjectref_to_string(self._object, out)
        var s_data = sonic[].diplomat_buffer_write_get_bytes(out)
        var s_len = sonic[].diplomat_buffer_write_len(out)
        var ret_str_ref = StringSlice[__origin_of(StaticConstantOrigin)](
            ptr=s_data.bitcast[Byte](), length=s_len
        )
        var ret_str = String(ret_str_ref)
        sonic[].diplomat_buffer_write_destroy(out)
        return ret_str

    @always_inline
    fn capacity(self) -> Int:
        return _sonic_ptr()[].jobjectref_capacity(self._object)

    @always_inline
    fn contains_key(self, key: StaticString) -> Bool:
        return _sonic_ptr()[].jobjectref_contains_key(self._object, key)

    @always_inline
    fn len(self) -> Int:
        return _sonic_ptr()[].jobjectref_len(self._object)

    @always_inline
    fn is_empty(self) -> Bool:
        return _sonic_ptr()[].jobjectref_is_empty(self._object)

    @always_inline
    fn destroy(self) -> None:
        return _sonic_ptr()[].jobjectref_destroy(self._object)

    @always_inline
    fn get_type(self) -> JsonType:
        return _sonic_ptr()[].jvalue_get_type(self._object.bitcast[JValue]())

    @always_inline
    fn get_value(self, key: StaticString) -> JsonValue:
        return JsonValue(_sonic_ptr()[].jobjectref_get_value(self._object, key))

    @always_inline
    fn get_bool(self, key: StaticString, default: Bool = False) -> Bool:
        return _sonic_ptr()[].jobjectref_get_bool(self._object, key, default)

    @always_inline
    fn get_i64(self, key: StaticString, default: Int64 = 0) -> Int64:
        var ret = _sonic_ptr()[].jobjectref_get_i64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_u64(self, key: StaticString, default: UInt64 = 0) -> UInt64:
        var ret = _sonic_ptr()[].jobjectref_get_u64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_f64(self, key: StaticString, default: Float64 = 0.0) -> Float64:
        var ret = _sonic_ptr()[].jobjectref_get_f64(self._object, key)
        if ret.is_ok:
            return ret.ok
        return default

    @always_inline
    fn get_str(self, key: StaticString, default: StaticString = "") -> String:
        var sonic = _sonic_ptr()
        var out = sonic[].diplomat_buffer_write_create(1024)
        sonic[].jobjectref_get_str(self._object, key, default, out)
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
    #     return jobjectref_get_str_ref(self._object, key, default)

    @always_inline
    fn get_object_ref(self, key: StaticString) -> JsonObjectRef:
        var ret = _sonic_ptr()[].jobjectref_get_object_ref(self._object, key)
        return JsonObjectRef(ret)

    @always_inline
    fn get_array_ref(self, key: StaticString) -> JsonArrayRef:
        var ret = _sonic_ptr()[].jobjectref_get_array_ref(self._object, key)
        return JsonArrayRef(ret)

    fn keys(self) -> List[String]:
        var sonic = _sonic_ptr()
        var iter = sonic[].jobjectref_keys_iter(self._object)
        var len = sonic[].jobjectref_len(self._object)
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
        var iter = sonic[].jobjectref_iter(self._object)
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
            var value_obj = JsonValueRef(value)
            ret.append((key_str, value_obj))
            sonic[].jkeyvalueref_destroy(kv)
        sonic[].jobjectiter_destroy(iter)
        return ret

    fn __str__(self) -> String:
        return self.to_string()

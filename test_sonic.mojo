from sonic import *
from sonic.internal.jvalue import *
from sonic.internal.jobject import *
from sonic.internal.jvalueref import *
from sonic.internal.jobjectmut import *
from testing import assert_equal, assert_true


fn test_sonic_rs_internal_sample() raises:
    var s = '{"a":100}'
    var v = jvalue_from_str(s)

    var o = v.bitcast[JObject]()
    jobject_insert_i64(o, "b", 101)
    jobject_insert_str(o, "c", "hello")
    var a = jvalue_from_str("[1,2,3]")
    jobject_insert_value(o, "d", a)

    var out = diplomat_buffer_write_create(1024)
    _ = jvalue_to_string(v, out)
    var s_data = diplomat_buffer_write_get_bytes(out)
    var s_len = diplomat_buffer_write_len(out)
    var ret_str_ref = StringRef(s_data, s_len)
    var ret_str = String(ret_str_ref)
    diplomat_buffer_write_destroy(out)
    jvalue_destroy(v)
    jvalue_destroy(a)

    _ = ret_str^


fn test_object() raises:
    var o = JsonObject('{"xxx": 1000}')
    var a = jobject_get_u64(o._object, "xxx")
    assert_equal(a.is_ok, True)
    assert_equal(a.ok, 1000)
    var b = jobject_get_i64(o._object, "xxx1")
    assert_equal(b.is_ok, False)


fn test_object_insert() raises:
    var o2 = JsonObject('{"a":"abc"}')
    o2.insert_str("b", "def")
    o2.insert_i64("c", 100)

    var v3 = o2.get_str("b")
    assert_equal(v3, "def")

    assert_equal(o2.to_string(), '{"a":"abc","b":"def","c":100}')


fn test_object_get() raises:
    var v4 = JsonObject('{"a":100, "b":true, "c": "hello", "f": 100.123}')
    assert_equal(v4.to_string(), '{"a":100,"b":true,"c":"hello","f":100.123}')

    var v5 = v4.get_i64("a")
    assert_equal(v5, 100)
    var v51 = v4.get_u64("a")
    assert_equal(v51, 100)
    var v6 = v4.get_bool("b")
    assert_equal(v6, True)
    var v7 = v4.get_str("c")
    assert_equal(v7, "hello")
    var v8 = v4.get_f64("f")
    assert_equal(v8, 100.123)


fn test_valueref() raises:
    var str = '{"a":100, "b":true, "c": "hello", "f": 100.123}'
    var v = JsonValue.from_str(str)
    var type_ = v.get_type()
    assert_true(type_ == JsonType.JsonType_Object)

    var a_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "a")
    var b_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "b")
    var c_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "c")
    var f_ref = jobject_get_value_ref(v._value.bitcast[JObject](), "f")
    var a = jvalueref_as_u64(a_ref)
    var b = jvalueref_as_bool(b_ref)
    var out = diplomat_buffer_write_create(1024)
    jvalueref_as_str(c_ref, "", out)
    var s_data = diplomat_buffer_write_get_bytes(out)
    var s_len = diplomat_buffer_write_len(out)
    var ret_str_ref = StringRef(s_data, s_len)
    var c = String(ret_str_ref)
    diplomat_buffer_write_destroy(out)
    var f = jvalueref_as_f64(f_ref)

    assert_equal(a.is_ok, True)
    assert_equal(a.ok, 100)
    assert_equal(b.is_ok, True)
    assert_equal(b.ok, True)
    assert_equal(c, "hello")
    assert_equal(f.is_ok, True)
    assert_equal(f.ok, 100.123)

    jvalueref_destroy(a_ref)
    jvalueref_destroy(b_ref)
    jvalueref_destroy(c_ref)
    jvalueref_destroy(f_ref)


fn test_object_view() raises:
    var v = JsonValue.from_str(
        '{"a":100, "b":true, "c": "hello", "f": 100.123}'
    )
    var o = JsonValueObjectView(v)
    var a = o.get_i64("a")
    o.insert_i64("b", 101)
    assert_equal(a, 100)
    assert_equal(o.to_string(), '{"a":100,"b":101,"c":"hello","f":100.123}')


fn test_array_view() raises:
    var v = JsonValue.from_str("[1,2,3]")
    var a = JsonValueArrayView(v)
    assert_equal(a.to_string(), "[1,2,3]")
    a.insert(0, JsonValue(100))
    assert_equal(a.to_string(), "[100,1,2,3]")


fn test_copy() raises:
    # value
    var v = JsonValue(100)
    var v2 = v
    assert_equal(v.to_string(), v2.to_string())

    var v3 = v2
    assert_equal(v.to_string(), v3.to_string())

    var v4 = JsonValue('"Hello"')
    var v5 = v4
    assert_equal(v4.to_string(), v5.to_string())

    var v6 = JsonValue.from_str('{"a":100}')
    var v7 = v6
    assert_equal(v6.to_string(), v7.to_string())

    var v8 = v7
    assert_equal(v6.to_string(), v8.to_string())

    # object
    var o = JsonObject('{"a":100}')
    var o2 = o
    assert_equal(o.to_string(), o2.to_string())

    var o3 = o
    assert_equal(o.to_string(), o3.to_string())

    # array
    var a = JsonArray()
    var a2 = a
    assert_equal(a.to_string(), a2.to_string())

    var a3 = a2
    assert_equal(a.to_string(), a3.to_string())

    var a4 = JsonArray("[1,2,3]")
    var a5 = a4
    assert_equal(a4.to_string(), a5.to_string())

    var a6 = a5
    assert_equal(a4.to_string(), a6.to_string())


fn test_read_json() raises:
    var o = JsonObject(
        '{"i64": 1000, "u64": 1000000000000000000, "b": true, "s": "Hi", "obj":'
        ' {"a": 100, "s": "hello"}, "arr": [1,2,3], "s_arr": ["a", "b", "c"],'
        ' "null": null}'
    )
    var i64 = o.get_i64("i64")
    assert_equal(i64, 1000)
    var u64 = o.get_u64("u64")
    assert_equal(u64, 1000000000000000000)
    var b = o.get_bool("b")
    assert_equal(b, True)
    var s = o.get_str("s")
    assert_equal(s, "Hi")
    var s_ref = o.get_str_ref("s")
    assert_equal(s_ref, "Hi")

    var obj = o.get_object_mut("obj")
    var obj_a = obj.get_i64("a")
    assert_equal(obj_a, 100)
    var obj_s = obj.get_str("s")
    assert_equal(obj_s, "hello")
    var obj_s_ref = obj.get_str_ref("s")
    assert_equal(obj_s_ref, "hello")

    var arr = o.get_array_mut("arr")
    var arr_0 = arr.get_i64(0)
    assert_equal(arr_0, 1)
    var arr_1 = arr.get_i64(1)
    assert_equal(arr_1, 2)
    var arr_2 = arr.get_i64(2)
    assert_equal(arr_2, 3)

    var s_arr = o.get_array_mut("s_arr")
    var s_arr_len = s_arr.len()
    assert_equal(s_arr_len, 3)
    var s_arr_0 = s_arr.get_str(0)
    assert_equal(s_arr_0, "a")
    var s_arr_0_ref = s_arr.get_str_ref(0)
    assert_equal(s_arr_0_ref, "a")
    var s_arr_1 = s_arr.get_str(1)
    assert_equal(s_arr_1, "b")
    var s_arr_1_ref = s_arr.get_str_ref(1)
    assert_equal(s_arr_1_ref, "b")
    var s_arr_2 = s_arr.get_str(2)
    assert_equal(s_arr_2, "c")
    var s_arr_2_ref = s_arr.get_str_ref(2)
    assert_equal(s_arr_2_ref, "c")
    var s_arr_3 = s_arr.get_str(3)
    assert_equal(s_arr_3, "")
    var s_arr_3_ref = s_arr.get_str_ref(3)
    assert_equal(s_arr_3_ref, "")
    var s_arr_4 = s_arr.get_str(4, "default")
    assert_equal(s_arr_4, "default")
    var s_arr_4_ref = s_arr.get_str_ref(4, "default")
    assert_equal(s_arr_4_ref, "default")

    var null = o.get_value("null")
    assert_equal(null.is_null(), True)

    var i64_2 = o.get_value("i64")
    assert_equal(i64_2.is_null(), False)


# Deep JSON structure
fn test_deep_json() raises:
    var o = JsonObject('{"a": {"b": {"c": 100}}}')
    var a = o.get_object_mut("a")
    var b = a.get_object_mut("b")
    var c = b.get_i64("c")
    assert_equal(c, 100)


# Write JSON
fn test_write_json() raises:
    var o = JsonObject('{"a": {"b": {"c": 100}}}')
    var a = o.get_object_mut("a")
    var b = a.get_object_mut("b")
    var c = b.get_i64("c")
    assert_equal(c, 100)
    o.insert_i64("d", 101)
    var a_2 = o.get_object_mut("a")
    assert_equal(a_2.to_string(), '{"b":{"c":100}}')
    assert_equal(o.to_string(), '{"a":{"b":{"c":100}},"d":101}')


# Write array
fn test_write_array() raises:
    var o = JsonObject('{"a": [1,2,3]}')
    var a = o.get_array_mut("a")
    var v = JsonValue(100)
    a.insert(0, v)
    assert_equal(o.to_string(), '{"a":[100,1,2,3]}')


# test object iterator
fn test_object_iterator() raises:
    var o = JsonObject('{"a":100, "b":200, "c":300}')
    var keys = o.keys()
    assert_equal(len(keys), 3)
    assert_equal(keys[0], "a")
    assert_equal(keys[1], "b")
    assert_equal(keys[2], "c")

    # TODO: fix this

    # var kvs = o.iter()
    # assert_equal(len(kvs), 3)
    # assert_equal(kvs[0][0], "a")
    # assert_equal(kvs[0][1].as_i64(), 100)
    # assert_equal(kvs[1][0], "b")
    # assert_equal(kvs[1][1].as_i64(), 200)
    # assert_equal(kvs[2][0], "c")
    # assert_equal(kvs[2][1].as_i64(), 300)

    # var key_list = List[String]()
    # var value_list = List[Int64]()

    # for kv in o.iter():
    #     var key = Pointer.address_of(kv[][0])
    #     var value = Pointer.address_of(kv[][1])
    #     key_list.append((key[]))
    #     value_list.append(value[].as_i64())

    # assert_equal(key_list[0], "a")
    # assert_equal(key_list[1], "b")
    # assert_equal(key_list[2], "c")
    # assert_equal(value_list[0], 100)
    # assert_equal(value_list[1], 200)
    # assert_equal(value_list[2], 300)


fn test_object_iterator_ref() raises:
    var body = String(
        '{"retCode":0,"retMsg":"OK","result":{"category":"linear","list":[{"symbol":"BTCUSDT","contractType":"LinearPerpetual","status":"Trading","baseCoin":"BTC","quoteCoin":"USDT","launchTime":"1585526400000","deliveryTime":"0","deliveryFeeRate":"","priceScale":"2","leverageFilter":{"minLeverage":"1","maxLeverage":"100.00","leverageStep":"0.01"},"priceFilter":{"minPrice":"0.10","maxPrice":"199999.80","tickSize":"0.10"},"lotSizeFilter":{"maxOrderQty":"100.000","minOrderQty":"0.001","qtyStep":"0.001","postOnlyMaxOrderQty":"1000.000"},"unifiedMarginTrade":true,"fundingInterval":480,"settleCoin":"USDT","copyTrading":"normalOnly"}],"nextPageCursor":""},"retExtInfo":{},"time":1696236288675}'
    )

    var doc = JsonObject(body)
    var ret_code = doc.get_i64("retCode")
    var ret_msg = doc.get_str("retMsg")
    if ret_code != 0:
        raise "error retCode=" + str(ret_code) + ", retMsg=" + ret_msg

    var result = doc.get_object_ref("result")
    var result_list = result.get_array_ref("list")

    if result_list.len() == 0:
        raise "error list length is 0"

    var list_iter = result_list.iter()
    while True:
        var value = list_iter.next()
        if value.is_null():
            break

        var obj = value.as_object_ref()

        var symbol_ = obj.get_str("symbol")

        var priceFilter = obj.get_object_ref("priceFilter")
        var tick_size = float(priceFilter.get_str("tickSize"))
        var lotSizeFilter = obj.get_object_ref("lotSizeFilter")
        var stepSize = float(lotSizeFilter.get_str("qtyStep"))

        assert_equal(symbol_, "BTCUSDT")
        assert_equal(tick_size, 0.1)
        assert_equal(stepSize, 0.001)


fn test_object_iterator_mut() raises:
    var body = String(
        '{"retCode":0,"retMsg":"OK","result":{"category":"linear","list":[{"symbol":"BTCUSDT","contractType":"LinearPerpetual","status":"Trading","baseCoin":"BTC","quoteCoin":"USDT","launchTime":"1585526400000","deliveryTime":"0","deliveryFeeRate":"","priceScale":"2","leverageFilter":{"minLeverage":"1","maxLeverage":"100.00","leverageStep":"0.01"},"priceFilter":{"minPrice":"0.10","maxPrice":"199999.80","tickSize":"0.10"},"lotSizeFilter":{"maxOrderQty":"100.000","minOrderQty":"0.001","qtyStep":"0.001","postOnlyMaxOrderQty":"1000.000"},"unifiedMarginTrade":true,"fundingInterval":480,"settleCoin":"USDT","copyTrading":"normalOnly"}],"nextPageCursor":""},"retExtInfo":{},"time":1696236288675}'
    )

    var doc = JsonObject(body)
    var ret_code = doc.get_i64("retCode")
    var ret_msg = doc.get_str("retMsg")
    if ret_code != 0:
        raise "error retCode=" + str(ret_code) + ", retMsg=" + ret_msg

    var result = doc.get_object_mut("result")
    var result_list = result.get_array_mut("list")

    if result_list.len() == 0:
        raise "error list length is 0"

    var list_iter = result_list.iter_mut()
    while True:
        var value = list_iter.next()
        if value.is_null():
            break

        var obj = value.as_object_mut()

        var symbol_ = obj.get_str("symbol")

        var priceFilter = obj.get_object_mut("priceFilter")
        var tick_size = float(priceFilter.get_str("tickSize"))
        var lotSizeFilter = obj.get_object_mut("lotSizeFilter")
        var stepSize = float(lotSizeFilter.get_str("qtyStep"))

        assert_equal(symbol_, "BTCUSDT")
        assert_equal(tick_size, 0.1)
        assert_equal(stepSize, 0.001)

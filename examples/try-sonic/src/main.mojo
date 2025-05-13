from sonic import JsonObject, sonic_ctx_ptr


fn main() raises:
    var ctx = sonic_ctx_ptr()
    # Create a JSON object
    var o = JsonObject(
        ctx,
        (
            '{"i64": 1000, "u64": 1000000000000000000, "b": true, "s": "Hi",'
            ' "obj": {"a": 100, "s": "hello"}, "arr": [1,2,3], "s_arr": ["a",'
            ' "b", "c"], "null": null}'
        ),
    )

    # Reading
    var i64 = o.get_i64("i64")
    var u64 = o.get_u64("u64")
    var b = o.get_bool("b")
    var s = o.get_str("s")

    # Reading nested object
    var obj = o.get_object_mut("obj")
    var obj_a = obj.get_i64("a")
    var obj_s = obj.get_str("s")

    # Reading array
    var arr = o.get_array_mut("arr")
    var arr_0 = arr.get_i64(0)
    var arr_1 = arr.get_i64(1)
    var arr_2 = arr.get_i64(2)

    # Reading string array
    var s_arr = o.get_array_mut("s_arr")
    var s_arr_len = s_arr.len()
    var s_arr_0 = s_arr.get_str(0)
    var s_arr_1 = s_arr.get_str(1)
    var s_arr_2 = s_arr.get_str(2)

    # Handling null value
    var null = o.get_value("null")
    var i64_2 = o.get_value("i64")

    # Printing results
    print("i64: ", i64)
    print("u64: ", u64)
    print("bool: ", b)
    print("string: ", s)
    print("obj.a: ", obj_a)
    print("obj.s: ", obj_s)
    print("arr[0]: ", arr_0)
    print("arr[1]: ", arr_1)
    print("arr[2]: ", arr_2)
    print("s_arr length: ", s_arr_len)
    print("s_arr[0]: ", s_arr_0)
    print("s_arr[1]: ", s_arr_1)
    print("s_arr[2]: ", s_arr_2)
    print("null is null: ", null.is_null())
    print("i64 is null: ", i64_2.is_null())

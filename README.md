# sonic-mojo
A high-performance JSON processing library for the Mojo programming language, providing bindings for the Sonic-RS library and leveraging SIMD for fast JSON parsing and manipulation.

## Usage

### add 

- channel: 
  - https://prefix.dev/channels/furnace-dev
  - https://prefix.dev/channels/furnace-dev-nightly
- add channel:

```bash
# for libsonic & sonic
magic project channel add "https://repo.prefix.dev/furnace-dev" 

# for sonic-mojo + nightly
magic project channel add "https://repo.prefix.dev/furnace-dev-nightly"


```

- add package:

```bash
# add rust binary lib (required for sonic-mojo)
magic add libsonic

# add mojopkg
magic add sonic


```

### Release 

```ruby
# install requirements
magic i


# build rust libsonic 
task br
  
# build mojo lib 
task bm

# publish rust libsonic
task publish:ffi


# publish mojo lib
task publish:mojo 

  
   
```





### Compile the sonic-rs library

```bash
cargo build --release
```

### Generate bindings for sonic-rs

```bash
cargo run --release -- generator
```

### Update the files in the internal directory to use the correct library name

```bash
sed -i 's/libXXX/libsonic/g' ./sonic/internal/diplomat_runtime.mojo
```

### Run the tests

```bash
cp ./target/release/libsonic.so ./

magic shell
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(realpath .)
mojo test test_sonic.mojo
```

### Package the sonic-mojo library

```bash
mojo package ./sonic -o ./sonic_mojo.mojopkg
```

## Examples

Here’s a quick example of how to use Sonic-Mojo to read and write JSON data:

### Reading JSON

```mojo
fn main() raises:
    var ctx = get_sonic_context()
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
```

### Writing JSON

```mojo
fn main() raises:
    var ctx = get_sonic_context()
    # Create a JSON object
    var o = JsonObject(ctx, '{"a": {"b": {"c": 100}}}')

    # Get the nested object
    var a = o.get_object_mut("a")
    var b = a.get_object_mut("b")

    # Read the current value
    var c = b.get_i64("c")

    # Output the current value
    print("Initial value of c: ", c)

    # Write a new value
    o.insert_bool("f", True)
    o.insert_u64("g", 1000000000000000000)
    o.insert_i64("d", 101)
    o.insert_str("e", "hello")
    o.insert_array("h", JsonArray())
    o.insert_object("i", JsonObject('{"j": 100}'))

    # Get the updated object
    var a_2 = o.get_object_mut("a")

    # Print the string representation of the nested object
    print("Updated object a: ", a_2.to_string())

    # Print the string representation of the entire JSON object
    print("Updated JSON object: ", o.to_string())
```

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request. Make sure to follow the contribution guidelines.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgments

- [Sonic-RS](https://github.com/cloudwego/sonic-rs) for providing the foundation of this library.
- [Diplomat](https://github.com/rust-diplomat/diplomat) for the code generation tool used to create Mojo bindings, with modifications in my forked version [f0cii/diplomat](https://github.com/f0cii/diplomat).
- The community for their support and contributions.

---

Feel free to modify any sections to better fit your project or add any additional information you think is necessary!
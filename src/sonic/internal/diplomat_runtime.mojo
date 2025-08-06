from memory import UnsafePointer
from sys.ffi import DLHandle
from sys.ffi import c_char, c_size_t
from sys import CompilationTarget
from os import abort


alias c_bool = Bool
alias c_char_ptr = UnsafePointer[c_char]
alias c_float = Float32
alias c_double = Float64
alias c_int = Int
alias c_uint = UInt
alias c_int8 = Int8
alias c_uint8 = UInt8
alias c_int16 = Int16
alias c_uint16 = UInt16
alias c_int32 = Int32
alias c_int64 = Int64
alias c_uchar = UInt8
alias c_uint32 = UInt32
alias c_uint64 = UInt64
alias c_void = UInt8
alias c_void_ptr = UnsafePointer[c_void]
alias c_nullptr = c_void_ptr()


# os platform:
fn get_libname() -> StaticString:
    @parameter
    if CompilationTarget.is_macos():
        return "libsonic.dylib"
    else:
        return "libsonic.so"


alias LIBNAME = get_libname()


fn get_handle(name: StaticString) -> DLHandle:
    try:
        return DLHandle(name)
    except e:
        return abort[DLHandle](String("library not found: ", e))


@fieldwise_init
@register_passable("trivial")
struct DiplomatWrite(Copyable, Movable):
    var context: c_void_ptr
    var buf: c_char_ptr
    var len: c_size_t
    var cap: c_size_t
    var flush: fn (UnsafePointer[DiplomatWrite]) -> None
    var grow: fn (UnsafePointer[DiplomatWrite], c_size_t) -> Bool


# @value
# @register_passable("trivial")
# struct DiplomatStringView:
#    var data: c_char_ptr
#    var len: c_size_t


alias DiplomatStringView = StaticString


@fieldwise_init
@register_passable("trivial")
struct OptionI8Result(Copyable, Movable):
    var ok: c_int8
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionU8Result(Copyable, Movable):
    var ok: c_uint8
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionI16Result(Copyable, Movable):
    var ok: c_int16
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionU16Result(Copyable, Movable):
    var ok: c_uint16
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionI32Result(Copyable, Movable):
    var ok: c_int32
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionU32Result(Copyable, Movable):
    var ok: c_uint32
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionI64Result(Copyable, Movable):
    var ok: c_int64
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionU64Result(Copyable, Movable):
    var ok: c_uint64
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionF32Result(Copyable, Movable):
    var ok: c_float
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionF64Result(Copyable, Movable):
    var ok: c_double
    var is_ok: c_bool


@fieldwise_init
@register_passable("trivial")
struct OptionBoolResult(Copyable, Movable):
    var ok: c_bool
    var is_ok: c_bool


alias fn_diplomat_simple_write = fn (
    buf: c_void_ptr, buf_size: c_size_t
) -> UnsafePointer[DiplomatWrite]

alias fn_diplomat_buffer_write_create = fn (cap: c_size_t) -> UnsafePointer[
    DiplomatWrite
]

alias fn_diplomat_buffer_write_get_bytes = fn (
    this: UnsafePointer[DiplomatWrite]
) -> c_void_ptr

alias fn_diplomat_buffer_write_len = fn (
    this: UnsafePointer[DiplomatWrite]
) -> c_size_t

alias fn_diplomat_buffer_write_destroy = fn (
    this: UnsafePointer[DiplomatWrite]
) -> None


# # var __wrapper = _DLWrapper()

# @value
# struct _DLWrapper:
#     var _handle: DLHandle

#     var _diplomat_simple_write: fn_diplomat_simple_write

#     var _diplomat_buffer_write_create: fn_diplomat_buffer_write_create

#     var _diplomat_buffer_write_get_bytes: fn_diplomat_buffer_write_get_bytes

#     var _diplomat_buffer_write_len: fn_diplomat_buffer_write_len

#     var _diplomat_buffer_write_destroy: fn_diplomat_buffer_write_destroy

#     fn __init__(out self):
#         self._handle = get_handle(LIBNAME)

#         self._diplomat_simple_write = self._handle.get_function[
#             fn_diplomat_simple_write
#         ]("diplomat_simple_write")

#         self._diplomat_buffer_write_create = self._handle.get_function[
#             fn_diplomat_buffer_write_create
#         ]("diplomat_buffer_write_create")

#         self._diplomat_buffer_write_get_bytes = self._handle.get_function[
#             fn_diplomat_buffer_write_get_bytes
#         ]("diplomat_buffer_write_get_bytes")

#         self._diplomat_buffer_write_len = self._handle.get_function[
#             fn_diplomat_buffer_write_len
#         ]("diplomat_buffer_write_len")

#         self._diplomat_buffer_write_destroy = self._handle.get_function[
#             fn_diplomat_buffer_write_destroy
#         ]("diplomat_buffer_write_destroy")


# @always_inline
# fn diplomat_simple_write(
#     buf: c_void_ptr, buf_size: c_size_t
# ) -> UnsafePointer[DiplomatWrite]:
#     return __wrapper._diplomat_simple_write(buf, buf_size)


# @always_inline
# fn diplomat_buffer_write_create(cap: c_size_t) -> UnsafePointer[DiplomatWrite]:
#     return __wrapper._diplomat_buffer_write_create(cap)


# @always_inline
# fn diplomat_buffer_write_get_bytes(
#     this: UnsafePointer[DiplomatWrite],
# ) -> c_void_ptr:
#     return __wrapper._diplomat_buffer_write_get_bytes(this)


# @always_inline
# fn diplomat_buffer_write_len(this: UnsafePointer[DiplomatWrite]) -> c_size_t:
#     return __wrapper._diplomat_buffer_write_len(this)


# @always_inline
# fn diplomat_buffer_write_destroy(this: UnsafePointer[DiplomatWrite]) -> None:
#     return __wrapper._diplomat_buffer_write_destroy(this)

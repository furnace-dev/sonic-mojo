from benchmark import Bench, BenchConfig, Bencher, BenchId
import benchmark
from sonic.internal import *
from sonic import *


@parameter
fn bench_small_keys1(mut b: Bencher) raises:
    # var words = gen_word_pairs[s]()

    @always_inline
    @parameter
    fn call_fn():
        _ = get_sonic_context()[]

    b.iter[call_fn]()


@parameter
fn bench_small_keys2(mut b: Bencher) raises:
    # var words = gen_word_pairs[s]()

    @always_inline
    @parameter
    fn call_fn():
        _ = Sonic().csonic()

    b.iter[call_fn]()


fn main() raises:
    var s_ = String('{"a": 100}')
    var s_ref = StaticString(
        ptr=s_.unsafe_cstr_ptr().bitcast[Byte](), length=len(s_)
    )
    var ctx = get_sonic_context()
    _ = ctx[].jvalue_from_str(s_ref)
    _ = Sonic().csonic().jvalue_from_str(s_ref)

    _ = JsonObject(ctx, s_)
    # run(_test_coro_latency())

    var m = Bench(BenchConfig(num_repetitions=1))
    m.bench_function[bench_small_keys1](BenchId("bench_small_keys1"))
    m.bench_function[bench_small_keys2](BenchId("bench_small_keys2"))
    # m.bench_function[bench_small_keys_new_hash_function[words_ar]](
    #     BenchId("bench_small_keys_new_ar")
    # )
    m.dump_report()

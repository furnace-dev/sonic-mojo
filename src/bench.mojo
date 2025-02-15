from sonic import *
from benchmark import *

fn get_data(file: String) -> String:
	try:
		with open("./bench_data/data/" + file, "r") as f:
			return f.read()
	except:
		pass
	print("read failed")
	return "READ FAILED"

fn main() raises:
	var config = BenchConfig()
	config.verbose_timing = True
	config.tabular_view = True
	var m = Bench(config)

	var canada = get_data("canada.json")
	var catalog = get_data("citm_catalog.json")
	var twitter = get_data("twitter.json")

	var data: String
	with open("./bench_data/users_1k.json", "r") as f:
		data = f.read()

	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonParseSmall"), small_data)
	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonArrayMedium"), medium_array)
	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonArrayLarge"), large_array)
	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonArrayExtraLarge"), data)
	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonArrayCanada"), canada)
	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonArrayTwitter"), twitter)
	m.bench_with_input[String, benchmark_json_parse](BenchId("JsonArrayCitmCatalog"), catalog)

	m.bench_with_input[JsonValue, benchmark_json_stringify](BenchId("JsonStringify"), JsonValue.from_str(large_array))
	m.bench_with_input[JsonValue, benchmark_json_stringify](BenchId("JsonStringifyCanada"), JsonValue.from_str(canada))
	m.bench_with_input[JsonValue, benchmark_json_stringify](BenchId("JsonStringifyTwitter"), JsonValue.from_str(twitter))
	m.bench_with_input[JsonValue, benchmark_json_stringify](BenchId("JsonStringifyCitmCatalog"), JsonValue.from_str(catalog))

	m.bench_with_input[String, benchmark_value_parse](BenchId("ValueParseBool"), "false")
	m.bench_with_input[String, benchmark_value_parse](BenchId("ValueParseNull"), "null")
	m.bench_with_input[String, benchmark_value_parse](BenchId("ValueParseInt"), "12345")
	m.bench_with_input[String, benchmark_value_parse](BenchId("ValueParseFloat"), "453.45643")
	m.bench_with_input[String, benchmark_value_parse](BenchId("ValueParseString"), '"some example string of short length, not all that long really"')

	m.bench_with_input[JsonValue, benchmark_value_stringify](BenchId("ValueStringifyBool"), JsonValue(False))
	m.bench_with_input[JsonValue, benchmark_value_stringify](BenchId("ValueStringifyNull"), JsonValue())
	m.bench_with_input[JsonValue, benchmark_value_stringify](BenchId("ValueStringifyInt"), JsonValue(12345))
	m.bench_with_input[JsonValue, benchmark_value_stringify](BenchId("ValueStringifyFloat"), JsonValue(456.345))
	m.bench_with_input[JsonValue, benchmark_value_stringify](BenchId("ValueStringifyString"), JsonValue('"some example string of short length, not all that long really"'))

	m.dump_report()

@parameter
fn benchmark_value_parse(inout b: Bencher, s: String) raises:
	@always_inline
	@parameter
	fn do() raises:
		_ = JsonValue.from_str(s)
	b.iter[do]()
	_ = s

@parameter
fn benchmark_json_parse(inout b: Bencher, s: String) raises:
	@always_inline
	@parameter
	fn do() raises:
		_ = JsonValue.from_str(s)
	b.iter[do]()
	_ = s

@parameter
fn benchmark_value_stringify(inout b: Bencher, v: JsonValue) raises:
	@always_inline
	@parameter
	fn do():
		_ = str(v)
	b.iter[do]()

@parameter
fn benchmark_json_stringify(inout b: Bencher, json: JsonValue) raises:
	@always_inline
	@parameter
	fn do() raises:
		_ = str(json)
	
	b.iter[do]()

# source https://opensource.adobe.com/Spry/samples/data_region/JSONDataSetSample.html
var small_data = """{
	"id": "0001",
	"type": "donut",
	"name": "Cake",
	"ppu": 0.55,
	"batters":
		{
			"batter":
				[
					{ "id": "1001", "type": "Regular" },
					{ "id": "1002", "type": "Chocolate" },
					{ "id": "1003", "type": "Blueberry" },
					{ "id": "1004", "type": "Devil's Food" }
				]
		},
	"topping":
		[
			{ "id": "5001", "type": "None" },
			{ "id": "5002", "type": "Glazed" },
			{ "id": "5005", "type": "Sugar" },
			{ "id": "5007", "type": "Powdered Sugar" },
			{ "id": "5006", "type": "Chocolate with Sprinkles" },
			{ "id": "5003", "type": "Chocolate" },
			{ "id": "5004", "type": "Maple" }
		]
}"""

var medium_array = """
[
	{
		"id": "0001",
		"type": "donut",
		"name": "Cake",
		"ppu": 0.55,
		"batters":
			{
				"batter":
					[
						{ "id": "1001", "type": "Regular" },
						{ "id": "1002", "type": "Chocolate" },
						{ "id": "1003", "type": "Blueberry" },
						{ "id": "1004", "type": "Devil's Food" }
					]
			},
		"topping":
			[
				{ "id": "5001", "type": "None" },
				{ "id": "5002", "type": "Glazed" },
				{ "id": "5005", "type": "Sugar" },
				{ "id": "5007", "type": "Powdered Sugar" },
				{ "id": "5006", "type": "Chocolate with Sprinkles" },
				{ "id": "5003", "type": "Chocolate" },
				{ "id": "5004", "type": "Maple" }
			]
	},
	{
		"id": "0002",
		"type": "donut",
		"name": "Raised",
		"ppu": 0.55,
		"batters":
			{
				"batter":
					[
						{ "id": "1001", "type": "Regular" }
					]
			},
		"topping":
			[
				{ "id": "5001", "type": "None" },
				{ "id": "5002", "type": "Glazed" },
				{ "id": "5005", "type": "Sugar" },
				{ "id": "5003", "type": "Chocolate" },
				{ "id": "5004", "type": "Maple" }
			]
	},
	{
		"id": "0003",
		"type": "donut",
		"name": "Old Fashioned",
		"ppu": 0.55,
		"batters":
			{
				"batter":
					[
						{ "id": "1001", "type": "Regular" },
						{ "id": "1002", "type": "Chocolate" }
					]
			},
		"topping":
			[
				{ "id": "5001", "type": "None" },
				{ "id": "5002", "type": "Glazed" },
				{ "id": "5003", "type": "Chocolate" },
				{ "id": "5004", "type": "Maple" }
			]
	}
]
"""

var large_array = """
[{"id":0,"name":"Elijah","city":"Austin","age":78,"friends":[{"name":"Michelle","hobbies":["Watching Sports","Reading","Skiing & Snowboarding"]},{"name":"Robert","hobbies":["Traveling","Video Games"]}]},{"id":1,"name":"Noah","city":"Boston","age":97,"friends":[{"name":"Oliver","hobbies":["Watching Sports","Skiing & Snowboarding","Collecting"]},{"name":"Olivia","hobbies":["Running","Music","Woodworking"]},{"name":"Robert","hobbies":["Woodworking","Calligraphy","Genealogy"]},{"name":"Ava","hobbies":["Walking","Church Activities"]},{"name":"Michael","hobbies":["Music","Church Activities"]},{"name":"Michael","hobbies":["Martial Arts","Painting","Jewelry Making"]}]},{"id":2,"name":"Evy","city":"San Diego","age":48,"friends":[{"name":"Joe","hobbies":["Reading","Volunteer Work"]},{"name":"Joe","hobbies":["Genealogy","Golf"]},{"name":"Oliver","hobbies":["Collecting","Writing","Bicycling"]},{"name":"Liam","hobbies":["Church Activities","Jewelry Making"]},{"name":"Amelia","hobbies":["Calligraphy","Dancing"]}]},{"id":3,"name":"Oliver","city":"St. Louis","age":39,"friends":[{"name":"Mateo","hobbies":["Watching Sports","Gardening"]},{"name":"Nora","hobbies":["Traveling","Team Sports"]},{"name":"Ava","hobbies":["Church Activities","Running"]},{"name":"Amelia","hobbies":["Gardening","Board Games","Watching Sports"]},{"name":"Leo","hobbies":["Martial Arts","Video Games","Reading"]}]},{"id":4,"name":"Michael","city":"St. Louis","age":95,"friends":[{"name":"Mateo","hobbies":["Movie Watching","Collecting"]},{"name":"Chris","hobbies":["Housework","Bicycling","Collecting"]}]},{"id":5,"name":"Michael","city":"Portland","age":19,"friends":[{"name":"Jack","hobbies":["Painting","Television"]},{"name":"Oliver","hobbies":["Walking","Watching Sports","Movie Watching"]},{"name":"Charlotte","hobbies":["Podcasts","Jewelry Making"]},{"name":"Elijah","hobbies":["Eating Out","Painting"]}]},{"id":6,"name":"Lucas","city":"Austin","age":76,"friends":[{"name":"John","hobbies":["Genealogy","Cooking"]},{"name":"John","hobbies":["Socializing","Yoga"]}]},{"id":7,"name":"Michelle","city":"San Antonio","age":25,"friends":[{"name":"Jack","hobbies":["Music","Golf"]},{"name":"Daniel","hobbies":["Socializing","Housework","Walking"]},{"name":"Robert","hobbies":["Collecting","Walking"]},{"name":"Nora","hobbies":["Painting","Church Activities"]},{"name":"Mia","hobbies":["Running","Painting"]}]},{"id":8,"name":"Emily","city":"Austin","age":61,"friends":[{"name":"Nora","hobbies":["Bicycling","Skiing & Snowboarding","Watching Sports"]},{"name":"Ava","hobbies":["Writing","Reading","Collecting"]},{"name":"Amelia","hobbies":["Eating Out","Watching Sports"]},{"name":"Daniel","hobbies":["Skiing & Snowboarding","Martial Arts","Writing"]},{"name":"Zoey","hobbies":["Board Games","Tennis"]}]},{"id":9,"name":"Liam","city":"New Orleans","age":33,"friends":[{"name":"Chloe","hobbies":["Traveling","Bicycling","Shopping"]},{"name":"Evy","hobbies":["Eating Out","Watching Sports"]},{"name":"Grace","hobbies":["Jewelry Making","Yoga","Podcasts"]}]}]"""
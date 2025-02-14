#[diplomat::bridge]
mod ffi {
    use diplomat_runtime::DiplomatWrite;
    use lazy_static::lazy_static;
    use sonic_rs::{from_str, JsonContainerTrait};
    use sonic_rs::{Array, JsonValueTrait, Object, Value};
    use sonic_rs::{JsonValueMutTrait, Number};
    use std::fmt::Write;
    use std::ptr::addr_of_mut;
    use std::str::FromStr;

    // static NULL_VALUE: Value = Value::new();
    // static NULL_OBJECT: Object = Object::new();
    // static NULL_ARRAY: Array = Array::new();

    lazy_static! {
        static ref NULL_VALUE: Value = Value::new();
        static ref NULL_OBJECT: Object = Object::new();
        static ref NULL_ARRAY: Array = Array::new();
    }

    #[diplomat::enum_convert(sonic_rs::JsonType)]
    pub enum JsonType {
        Null = 0,
        Boolean = 1,
        Number = 2,
        String = 3,
        Object = 4,
        Array = 5,
    }

    #[diplomat::opaque]
    pub struct JValue(Value);

    #[diplomat::opaque]
    pub struct JValueRef<'a>(&'a Value);

    #[diplomat::opaque]
    pub struct JValueMut<'a>(&'a mut Value);

    #[diplomat::opaque]
    pub struct JKeyValueRef<'a>(&'a str, &'a Value);

    #[diplomat::opaque]
    pub struct JKeyValueMut<'a>(&'a str, &'a mut Value);

    #[diplomat::opaque]
    pub struct JObject(Object);

    #[diplomat::opaque]
    pub struct JObjectRef<'a>(&'a Object);

    #[diplomat::opaque]
    pub struct JObjectMut<'a>(&'a mut Object);

    #[diplomat::opaque]
    pub struct JArray(Array);

    #[diplomat::opaque]
    pub struct JArrayRef<'a>(&'a Array);

    #[diplomat::opaque]
    pub struct JArrayMut<'a>(&'a mut Array);

    #[diplomat::opaque]
    pub struct JKeysIter(pub Vec<String>);

    // #[diplomat::opaque]
    // pub struct JKeysIter<'a>(std::slice::Iter<'a, &'a str>);

    #[diplomat::opaque]
    pub struct JObjectIter<'a>(sonic_rs::value::object::Iter<'a>);

    #[diplomat::opaque]
    pub struct JObjectIterMut<'a>(sonic_rs::value::object::IterMut<'a>);

    #[diplomat::opaque]
    pub struct JValueIter<'a>(std::slice::Iter<'a, Value>);

    #[diplomat::opaque]
    pub struct JValueIterMut<'a>(std::slice::IterMut<'a, Value>);

    impl JValue {
        #[diplomat::attr(auto, constructor)]
        pub fn new() -> Box<JValue> {
            Box::new(Self { 0: Value::new() })
        }

        pub fn new_bool(value: bool) -> Box<JValue> {
            Box::new(Self {
                0: Value::from(value),
            })
        }

        pub fn new_i64(value: i64) -> Box<JValue> {
            Box::new(Self {
                0: Value::from(value),
            })
        }

        pub fn new_u64(value: u64) -> Box<JValue> {
            Box::new(Self {
                0: Value::from(value),
            })
        }

        pub fn new_f64(value: f64) -> Box<JValue> {
            Box::new(Self {
                0: Number::from_f64(value).into(),
            })
        }

        pub fn new_str(value: &DiplomatStr) -> Box<JValue> {
            let value = unsafe { std::str::from_utf8_unchecked(value) };
            Box::new(Self {
                0: Value::from_str(value).unwrap(),
            })
        }

        pub fn from_str(s: &DiplomatStr) -> Box<JValue> {
            let s = unsafe { std::str::from_utf8_unchecked(s) };
            let value = from_str(s);
            if let Ok(value) = value {
                Box::new(Self { 0: value })
            } else {
                Box::new(Self { 0: Value::new() })
            }
        }

        pub fn clone(&self) -> Box<JValue> {
            Box::new(Self { 0: self.0.clone() })
        }

        // pub fn mark_root(&mut self) {
        //     self.0.mark_root();
        // }

        pub fn get_type(&self) -> JsonType {
            self.0.get_type().into()
        }

        pub fn is_boolean(&self) -> bool {
            self.0.is_boolean()
        }

        pub fn is_true(&self) -> bool {
            self.0.is_true()
        }

        pub fn is_false(&self) -> bool {
            self.0.is_false()
        }

        pub fn is_null(&self) -> bool {
            self.0.is_null()
        }

        pub fn is_number(&self) -> bool {
            self.0.is_number()
        }

        pub fn is_str(&self) -> bool {
            self.0.is_str()
        }

        pub fn is_array(&self) -> bool {
            self.0.is_array()
        }

        pub fn is_object(&self) -> bool {
            self.0.is_object()
        }

        pub fn is_f64(&self) -> bool {
            self.0.is_f64()
        }

        pub fn is_i64(&self) -> bool {
            self.0.is_i64()
        }

        pub fn is_u64(&self) -> bool {
            self.0.is_u64()
        }

        pub fn as_bool(&self) -> Option<bool> {
            self.0.as_bool()
        }

        pub fn as_i64(&self) -> Option<i64> {
            let a = self.0.as_i64();
            if let Some(a) = a {
                Some(a)
            } else {
                Some(0)
            }
        }

        pub fn as_u64(&self) -> Option<u64> {
            self.0.as_u64()
        }

        pub fn as_f64(&self) -> Option<f64> {
            self.0.as_f64()
        }

        // fn as_number(&self) -> Option<Number>

        pub fn as_str(&self, default: &DiplomatStr, out: &mut DiplomatWrite) {
            let s = self.0.as_str();
            if let Some(s) = s {
                _ = out.write_str(&s);
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
            }
            out.flush();
        }

        // pub fn as_str_ref<'a>(&'a self, default: &'a DiplomatStr) -> &'a DiplomatStr {
        //     let s = self.0.as_str();
        //     if let Some(s) = s {
        //         s.as_bytes()
        //     } else {
        //         default
        //     }
        // }

        pub fn as_object(&self) -> Box<JObject> {
            if self.0.is_object() {
                let obj = self.0.as_object();
                if let Some(obj) = obj {
                    Box::new(JObject(obj.clone()))
                } else {
                    Box::new(JObject(Object::new()))
                }
            } else {
                Box::new(JObject(Object::new()))
            }
        }

        pub fn as_object_mut<'a>(&'a mut self) -> Box<JObjectMut<'a>> {
            let obj = self.0.as_object_mut().unwrap();
            Box::new(JObjectMut(obj))
        }

        pub fn as_array(&self) -> Box<JArray> {
            if self.0.is_array() {
                let arr = self.0.as_array();
                if let Some(arr) = arr {
                    Box::new(JArray(arr.clone()))
                } else {
                    Box::new(JArray(Array::new()))
                }
            } else {
                Box::new(JArray(Array::new()))
            }
        }

        pub fn as_array_mut<'a>(&'a mut self) -> Box<JArrayMut<'a>> {
            Box::new(JArrayMut(self.0.as_array_mut().unwrap_or_else(|| {
                static mut TEMP_ARRAY: Array = Array::new();
                unsafe { &mut *addr_of_mut!(TEMP_ARRAY) }
            })))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = self.0.to_string();
            _ = out.write_str(&s);
            out.flush();
        }
    }

    impl<'a> JValueMut<'a> {
        pub fn clone(&self) -> Box<JValue> {
            Box::new(JValue { 0: self.0.clone() })
        }

        // pub fn mark_root(&mut self) {
        //     self.0.mark_root();
        // }

        pub fn get_type(&self) -> JsonType {
            self.0.get_type().into()
        }

        pub fn is_boolean(&self) -> bool {
            self.0.is_boolean()
        }

        pub fn is_true(&self) -> bool {
            self.0.is_true()
        }

        pub fn is_false(&self) -> bool {
            self.0.is_false()
        }

        pub fn is_null(&self) -> bool {
            self.0.is_null()
        }

        pub fn is_number(&self) -> bool {
            self.0.is_number()
        }

        pub fn is_str(&self) -> bool {
            self.0.is_str()
        }

        pub fn is_array(&self) -> bool {
            self.0.is_array()
        }

        pub fn is_object(&self) -> bool {
            self.0.is_object()
        }

        pub fn is_f64(&self) -> bool {
            self.0.is_f64()
        }

        pub fn is_i64(&self) -> bool {
            self.0.is_i64()
        }

        pub fn is_u64(&self) -> bool {
            self.0.is_u64()
        }

        pub fn as_bool(&self) -> Option<bool> {
            self.0.as_bool()
        }

        pub fn as_i64(&self) -> Option<i64> {
            let a = self.0.as_i64();
            if let Some(a) = a {
                Some(a)
            } else {
                Some(0)
            }
        }

        pub fn as_u64(&self) -> Option<u64> {
            self.0.as_u64()
        }

        pub fn as_f64(&self) -> Option<f64> {
            self.0.as_f64()
        }

        // fn as_number(&self) -> Option<Number>

        pub fn as_str(&self, default: &DiplomatStr, out: &mut DiplomatWrite) {
            let s = self.0.as_str();
            if let Some(s) = s {
                _ = out.write_str(&s);
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
            }
            out.flush();
        }

        // pub fn as_str_ref(&'a self, default: &'a DiplomatStr) -> &'a DiplomatStr {
        //     let s = self.0.as_str();
        //     if let Some(s) = s {
        //         s.as_bytes()
        //     } else {
        //         default
        //     }
        // }

        pub fn as_object_mut(&'a mut self) -> Box<JObjectMut<'a>> {
            let obj = self.0.as_object_mut().unwrap();
            Box::new(JObjectMut(obj))
        }

        pub fn as_array_mut(&'a mut self) -> Box<JArrayMut<'a>> {
            Box::new(JArrayMut(self.0.as_array_mut().unwrap()))
        }

        // pub fn as_array(&self) -> Box<JArray> {
        //     if self.0.is_array() {
        //         let arr = self.0.as_array();
        //         if let Some(arr) = arr {
        //             Box::new(JArray(arr.clone()))
        //         } else {
        //             Box::new(JArray(Array::new()))
        //         }
        //     } else {
        //         Box::new(JArray(Array::new()))
        //     }
        // }

        // pub fn as_array_mut<'a>(&'a mut self) -> Box<JArrayMut<'a>> {
        //     Box::new(JArrayMut(self.0.as_array_mut().unwrap_or_else(|| {
        //         static mut TEMP_ARRAY: Array = Array::new();
        //         unsafe { &mut TEMP_ARRAY }
        //     })))
        // }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = self.0.to_string();
            _ = out.write_str(&s);
            out.flush();
        }
    }

    impl<'a> JValueRef<'a> {
        pub fn clone(&self) -> Box<JValue> {
            Box::new(JValue(self.0.clone()))
        }

        pub fn get_type(&self) -> JsonType {
            self.0.get_type().into()
        }

        pub fn is_true(&self) -> bool {
            self.0.is_true()
        }

        pub fn is_false(&self) -> bool {
            self.0.is_false()
        }

        pub fn is_i64(&self) -> bool {
            self.0.is_i64()
        }

        pub fn is_u64(&self) -> bool {
            self.0.is_u64()
        }

        pub fn is_f64(&self) -> bool {
            self.0.is_f64()
        }

        pub fn is_str(&self) -> bool {
            self.0.is_str()
        }

        pub fn is_object(&self) -> bool {
            self.0.is_object()
        }

        pub fn is_array(&self) -> bool {
            self.0.is_array()
        }

        pub fn as_bool(&self) -> Option<bool> {
            self.0.as_bool()
        }

        pub fn as_i64(&self) -> Option<i64> {
            self.0.as_i64()
        }

        pub fn as_u64(&self) -> Option<u64> {
            self.0.as_u64()
        }

        pub fn as_f64(&self) -> Option<f64> {
            self.0.as_f64()
        }

        pub fn as_str(&self, default: &DiplomatStr, out: &mut DiplomatWrite) {
            let s = self.0.as_str();
            if let Some(s) = s {
                _ = out.write_str(s);
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
            }
            out.flush();
        }

        // pub fn as_str_ref(&'a self, default: &'a DiplomatStr) -> &'a DiplomatStr {
        //     let s = self.0.as_str();
        //     if let Some(s) = s {
        //         s.as_bytes()
        //     } else {
        //         default
        //     }
        // }

        pub fn as_object(&self) -> Box<JObject> {
            if self.0.is_object() {
                let obj = self.0.as_object().unwrap_or(&NULL_OBJECT);
                Box::new(JObject(obj.clone()))
            } else {
                Box::new(JObject(Object::new()))
            }
        }

        pub fn as_object_ref(&'a self) -> Box<JObjectRef<'a>> {
            Box::new(JObjectRef(self.0.as_object().unwrap_or(&NULL_OBJECT)))
        }

        pub fn as_array(&self) -> Box<JArray> {
            if self.0.is_array() {
                let arr = self.0.as_array().unwrap_or(&NULL_ARRAY);
                Box::new(JArray(arr.clone()))
            } else {
                Box::new(JArray(Array::new()))
            }
        }

        pub fn as_array_ref(&'a self) -> Box<JArrayRef<'a>> {
            Box::new(JArrayRef(self.0.as_array().unwrap_or(&NULL_ARRAY)))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = self.0.to_string();
            _ = out.write_str(&s);
            out.flush();
        }
    }

    impl JObject {
        #[diplomat::attr(auto, constructor)]
        pub fn new() -> Box<JObject> {
            Box::new(Self { 0: Object::new() })
        }

        pub fn with_capacity(capacity: usize) -> Box<JObject> {
            Box::new(Self {
                0: Object::with_capacity(capacity),
            })
        }

        pub fn from_str(s: &DiplomatStr) -> Box<JObject> {
            let s = unsafe { std::str::from_utf8_unchecked(s) };
            let value = from_str(s);
            if let Ok(value) = value {
                Box::new(Self { 0: value })
            } else {
                Box::new(Self { 0: Object::new() })
            }
        }

        pub fn clone(&self) -> Box<JObject> {
            Box::new(Self { 0: self.0.clone() })
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = sonic_rs::to_string(&self.0).unwrap();
            _ = out.write_str(&s);
            out.flush();
        }

        pub fn clear(&mut self) {
            self.0.clear();
        }

        pub fn capacity(&self) -> usize {
            self.0.capacity()
        }

        pub fn contains_key(&self, key: &DiplomatStr) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.contains_key(&key)
        }

        pub fn insert_null(&mut self, key: &DiplomatStr) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::new());
        }

        pub fn insert_bool(&mut self, key: &DiplomatStr, value: bool) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::from(value));
        }

        pub fn insert_i64(&mut self, key: &DiplomatStr, value: i64) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::from(value));
        }

        pub fn insert_u64(&mut self, key: &DiplomatStr, value: u64) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::from(value));
        }

        pub fn insert_f64(&mut self, key: &DiplomatStr, value: f64) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Number::from_f64(value).unwrap());
        }

        pub fn insert_str(&mut self, key: &DiplomatStr, value: &DiplomatStr) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let value = unsafe { std::str::from_utf8_unchecked(value) };
            self.0.insert(&key, Value::from_str(value).unwrap());
        }

        pub fn insert_value(&mut self, key: &DiplomatStr, value: &JValue) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, value.0.clone());
        }

        pub fn insert_object(&mut self, key: &DiplomatStr, value: &JObject) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, value.0.clone());
        }

        pub fn insert_array(&mut self, key: &DiplomatStr, value: &JArray) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, value.0.clone());
        }

        pub fn remove(&mut self, key: &DiplomatStr) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let value = self.0.remove(&key);
            value.is_some()
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn is_empty(&self) -> bool {
            self.0.is_empty()
        }

        pub fn get_value(&self, key: &DiplomatStr) -> Box<JValue> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let a = self.0.get(&key);
            if let Some(v) = a {
                Box::new(JValue(v.clone()))
            } else {
                Box::new(JValue(Value::new()))
            }
        }

        pub fn get_value_ref<'a>(&'a self, key: &DiplomatStr) -> Box<JValueRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key).unwrap_or(&NULL_VALUE);
            Box::new(JValueRef(v))
        }

        pub fn get_object_ref<'a>(&'a self, key: &DiplomatStr) -> Box<JObjectRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key).unwrap_or(&NULL_VALUE);
            Box::new(JObjectRef(v.as_object().unwrap()))
        }

        pub fn get_array_ref<'a>(&'a self, key: &DiplomatStr) -> Box<JArrayRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key).unwrap_or(&NULL_VALUE);
            Box::new(JArrayRef(v.as_array().unwrap()))
        }

        pub fn get_value_mut<'a>(&'a mut self, key: &DiplomatStr) -> Box<JValueMut<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get_mut(&key).unwrap();
            Box::new(JValueMut(v))
        }

        pub fn get_object_mut<'a>(&'a mut self, key: &DiplomatStr) -> Box<JObjectMut<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get_mut(&key).unwrap();
            Box::new(JObjectMut(v.as_object_mut().unwrap()))
        }

        pub fn get_array_mut<'a>(&'a mut self, key: &DiplomatStr) -> Box<JArrayMut<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get_mut(&key).unwrap();
            Box::new(JArrayMut(v.as_array_mut().unwrap()))
        }

        pub fn get_bool(&self, key: &DiplomatStr, default: bool) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key).as_bool();
            if let Some(v) = v {
                v
            } else {
                default
            }
        }

        pub fn get_i64(&self, key: &DiplomatStr) -> Option<i64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_i64())
        }

        pub fn get_u64(&self, key: &DiplomatStr) -> Option<u64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_u64())
        }

        pub fn get_f64(&self, key: &DiplomatStr) -> Option<f64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_f64())
        }

        pub fn get_str(&self, key: &DiplomatStr, default: &DiplomatStr, out: &mut DiplomatWrite) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            if let Some(v) = self.0.get(&key) {
                let s = v.as_str();
                if let Some(s) = s {
                    _ = out.write_str(s);
                    out.flush();
                } else {
                    let default = unsafe { std::str::from_utf8_unchecked(default) };
                    _ = out.write_str(default);
                    out.flush();
                }
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
                out.flush();
            }
        }

        // pub fn get_str_ref<'a>(
        //     &'a self,
        //     key: &DiplomatStr,
        //     default: &'a DiplomatStr,
        // ) -> &'a DiplomatStr {
        //     let key = unsafe { std::str::from_utf8_unchecked(key) };
        //     let value = self.0.get(&key);
        //     if let Some(value) = value {
        //         let s = value.as_str();
        //         if let Some(s) = s {
        //             s.as_bytes()
        //         } else {
        //             default
        //         }
        //     } else {
        //         default
        //     }
        // }

        pub fn keys_iter(&self) -> Box<JKeysIter> {
            let keys_iter = self
                .0
                .iter()
                .map(|(k, _)| k.to_string())
                .collect::<Vec<_>>();
            Box::new(JKeysIter(keys_iter))
        }

        pub fn iter<'a>(&'a self) -> Box<JObjectIter<'a>> {
            Box::new(JObjectIter(self.0.iter()))
        }

        pub fn iter_mut<'a>(&'a mut self) -> Box<JObjectIterMut<'a>> {
            Box::new(JObjectIterMut(self.0.iter_mut()))
        }
    }

    impl<'a> JObjectMut<'a> {
        pub fn clone(&self) -> Box<JObject> {
            Box::new(JObject(self.0.clone()))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = sonic_rs::to_string(&self.0).unwrap();
            _ = out.write_str(&s);
            out.flush();
        }

        pub fn clear(&mut self) {
            self.0.clear();
        }

        pub fn capacity(&self) -> usize {
            self.0.capacity()
        }

        pub fn contains_key(&self, key: &DiplomatStr) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.contains_key(&key)
        }

        pub fn insert_null(&mut self, key: &DiplomatStr) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::new());
        }

        pub fn insert_bool(&mut self, key: &DiplomatStr, value: bool) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::from(value));
        }

        pub fn insert_i64(&mut self, key: &DiplomatStr, value: i64) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::from(value));
        }

        pub fn insert_u64(&mut self, key: &DiplomatStr, value: u64) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Value::from(value));
        }

        pub fn insert_f64(&mut self, key: &DiplomatStr, value: f64) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, Number::from_f64(value).unwrap());
        }

        pub fn insert_str(&mut self, key: &DiplomatStr, value: &DiplomatStr) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let value = unsafe { std::str::from_utf8_unchecked(value) };
            self.0.insert(&key, Value::from_str(value).unwrap());
        }

        pub fn insert_value(&mut self, key: &DiplomatStr, value: &JValue) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, value.0.clone());
        }

        pub fn insert_object(&mut self, key: &DiplomatStr, value: &JObject) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, value.0.clone());
        }

        pub fn insert_array(&mut self, key: &DiplomatStr, value: &JArray) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.insert(&key, value.0.clone());
        }

        pub fn remove(&mut self, key: &DiplomatStr) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let value = self.0.remove(&key);
            value.is_some()
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn is_empty(&self) -> bool {
            self.0.is_empty()
        }

        pub fn get_value(&self, key: &DiplomatStr) -> Box<JValue> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let a = self.0.get(&key);
            if let Some(v) = a {
                Box::new(JValue(v.clone()))
            } else {
                Box::new(JValue(Value::new()))
            }
        }

        pub fn get_value_ref(&'a self, key: &DiplomatStr) -> Box<JValueRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key);
            if let Some(v) = v {
                Box::new(JValueRef(v))
            } else {
                Box::new(JValueRef(&NULL_VALUE))
            }
        }

        pub fn get_value_mut(&'a mut self, key: &DiplomatStr) -> Box<JValueMut<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get_mut(&key).unwrap();
            Box::new(JValueMut(v))
        }

        pub fn get_object_mut(&'a mut self, key: &DiplomatStr) -> Box<JObjectMut<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get_mut(&key).unwrap();
            Box::new(JObjectMut(v.as_object_mut().unwrap()))
        }

        pub fn get_array_mut(&'a mut self, key: &DiplomatStr) -> Box<JArrayMut<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get_mut(&key).unwrap();
            Box::new(JArrayMut(v.as_array_mut().unwrap()))
        }

        pub fn get_bool(&self, key: &DiplomatStr, default: bool) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key).as_bool();
            if let Some(v) = v {
                v
            } else {
                default
            }
        }

        pub fn get_i64(&self, key: &DiplomatStr) -> Option<i64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_i64())
        }

        pub fn get_u64(&self, key: &DiplomatStr) -> Option<u64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_u64())
        }

        pub fn get_f64(&self, key: &DiplomatStr) -> Option<f64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_f64())
        }

        pub fn get_str(&self, key: &DiplomatStr, default: &DiplomatStr, out: &mut DiplomatWrite) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            if let Some(v) = self.0.get(&key) {
                let s = v.as_str();
                if let Some(s) = s {
                    _ = out.write_str(s);
                    out.flush();
                } else {
                    let default = unsafe { std::str::from_utf8_unchecked(default) };
                    _ = out.write_str(default);
                    out.flush();
                }
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
                out.flush();
            }
        }

        // pub fn get_str_ref(
        //     &'a self,
        //     key: &DiplomatStr,
        //     default: &'a DiplomatStr,
        // ) -> &'a DiplomatStr {
        //     let key = unsafe { std::str::from_utf8_unchecked(key) };
        //     if let Some(v) = self.0.get(&key) {
        //         let s = v.as_str();
        //         if let Some(s) = s {
        //             s.as_bytes()
        //         } else {
        //             default
        //         }
        //     } else {
        //         default
        //     }
        // }

        pub fn keys_iter(&self) -> Box<JKeysIter> {
            let keys_iter = self
                .0
                .iter()
                .map(|(k, _)| k.to_string())
                .collect::<Vec<_>>();
            Box::new(JKeysIter(keys_iter))
        }

        pub fn iter(&'a self) -> Box<JObjectIter> {
            Box::new(JObjectIter(self.0.iter()))
        }
    }

    impl<'a> JObjectRef<'a> {
        pub fn clone(&self) -> Box<JObject> {
            Box::new(JObject(self.0.clone()))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = sonic_rs::to_string(&self.0).unwrap();
            _ = out.write_str(&s);
            out.flush();
        }

        pub fn capacity(&self) -> usize {
            self.0.capacity()
        }

        pub fn contains_key(&self, key: &DiplomatStr) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.contains_key(&key)
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn is_empty(&self) -> bool {
            self.0.is_empty()
        }

        pub fn get_value(&self, key: &DiplomatStr) -> Box<JValue> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let a = self.0.get(&key);
            if let Some(v) = a {
                Box::new(JValue(v.clone()))
            } else {
                Box::new(JValue(Value::new()))
            }
        }

        pub fn get_value_ref(&'a self, key: &DiplomatStr) -> Box<JValueRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key);
            if let Some(v) = v {
                Box::new(JValueRef(v))
            } else {
                Box::new(JValueRef(&NULL_VALUE))
            }
        }

        pub fn get_object_ref(&'a self, key: &DiplomatStr) -> Box<JObjectRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key);
            if let Some(v) = v {
                Box::new(JObjectRef(v.as_object().unwrap()))
            } else {
                Box::new(JObjectRef(&NULL_OBJECT))
            }
        }

        pub fn get_array_ref(&'a self, key: &DiplomatStr) -> Box<JArrayRef<'a>> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key);
            if let Some(v) = v {
                Box::new(JArrayRef(v.as_array().unwrap()))
            } else {
                Box::new(JArrayRef(&NULL_ARRAY))
            }
        }

        pub fn get_bool(&self, key: &DiplomatStr, default: bool) -> bool {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            let v = self.0.get(&key).as_bool();
            if let Some(v) = v {
                v
            } else {
                default
            }
        }

        pub fn get_i64(&self, key: &DiplomatStr) -> Option<i64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_i64())
        }

        pub fn get_u64(&self, key: &DiplomatStr) -> Option<u64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_u64())
        }

        pub fn get_f64(&self, key: &DiplomatStr) -> Option<f64> {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            self.0.get(&key).and_then(|v| v.as_f64())
        }

        pub fn get_str(&self, key: &DiplomatStr, default: &DiplomatStr, out: &mut DiplomatWrite) {
            let key = unsafe { std::str::from_utf8_unchecked(key) };
            if let Some(v) = self.0.get(&key) {
                let s = v.as_str();
                if let Some(s) = s {
                    _ = out.write_str(s);
                    out.flush();
                } else {
                    let default = unsafe { std::str::from_utf8_unchecked(default) };
                    _ = out.write_str(default);
                    out.flush();
                }
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
                out.flush();
            }
        }

        // pub fn get_str_ref(
        //     &'a self,
        //     key: &DiplomatStr,
        //     default: &'a DiplomatStr,
        // ) -> &'a DiplomatStr {
        //     let key = unsafe { std::str::from_utf8_unchecked(key) };
        //     if let Some(v) = self.0.get(&key) {
        //         let s = v.as_str();
        //         if let Some(s) = s {
        //             s.as_bytes()
        //         } else {
        //             default
        //         }
        //     } else {
        //         default
        //     }
        // }

        pub fn keys_iter(&self) -> Box<JKeysIter> {
            let keys_iter = self
                .0
                .iter()
                .map(|(k, _)| k.to_string())
                .collect::<Vec<_>>();
            Box::new(JKeysIter(keys_iter))
        }

        pub fn iter(&'a self) -> Box<JObjectIter> {
            Box::new(JObjectIter(self.0.iter()))
        }
    }

    impl JArray {
        #[diplomat::attr(auto, constructor)]
        pub fn new() -> Box<JArray> {
            Box::new(Self { 0: Array::new() })
        }

        pub fn from_str(s: &DiplomatStr) -> Box<JArray> {
            let s = unsafe { std::str::from_utf8_unchecked(s) };
            Box::new(Self {
                0: from_str(s).unwrap(),
            })
        }

        pub fn with_capacity(capacity: usize) -> Box<JArray> {
            Box::new(Self {
                0: Array::with_capacity(capacity),
            })
        }

        pub fn clone(&self) -> Box<JArray> {
            Box::new(JArray(self.0.clone()))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = sonic_rs::to_string(&self.0).unwrap();
            _ = out.write_str(&s);
            out.flush();
        }

        pub fn push_null(&mut self) {
            self.0.push(Value::new());
        }

        pub fn push_bool(&mut self, value: bool) {
            self.0.push(Value::from(value));
        }

        pub fn push_i64(&mut self, value: i64) {
            self.0.push(Value::from(value));
        }

        pub fn push_u64(&mut self, value: u64) {
            self.0.push(Value::from(value));
        }

        pub fn push_f64(&mut self, value: f64) {
            self.0.push(Number::from_f64(value).unwrap());
        }

        pub fn push_str(&mut self, value: &DiplomatStr) {
            let value = unsafe { std::str::from_utf8_unchecked(value) };
            self.0.push(Value::from_str(value).unwrap());
        }

        pub fn push_value(&mut self, value: &JValue) {
            self.0.push(value.0.clone());
        }

        pub fn push_object(&mut self, value: &JObject) {
            self.0.push(value.0.clone());
        }

        pub fn push_array(&mut self, value: &JArray) {
            self.0.push(value.0.clone());
        }

        pub fn insert(&mut self, index: usize, value: &JValue) {
            self.0.insert(index, value.0.clone());
        }

        pub fn pop(&mut self) -> Box<JValue> {
            let v = self.0.pop();
            if let Some(v) = v {
                Box::new(JValue(v))
            } else {
                Box::new(JValue(Value::new()))
            }
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn is_empty(&self) -> bool {
            self.0.is_empty()
        }

        pub fn clear(&mut self) {
            self.0.clear();
        }

        pub fn remove(&mut self, index: usize) {
            if index < self.0.len() {
                self.0.remove(index);
            }
        }

        pub fn get<'a>(&'a self, index: usize) -> Box<JValueRef<'a>> {
            if index < self.0.len() {
                Box::new(JValueRef(&self.0[index]))
            } else {
                Box::new(JValueRef(&NULL_VALUE))
            }
        }

        pub fn get_mut<'a>(&'a mut self, index: usize) -> Box<JValueMut<'a>> {
            let v = self.0.get_mut(index).unwrap();
            Box::new(JValueMut(v))
        }

        pub fn iter<'a>(&'a self) -> Box<JValueIter<'a>> {
            Box::new(JValueIter(self.0.iter()))
        }
    }

    impl<'a> JArrayRef<'a> {
        pub fn clone(&self) -> Box<JArray> {
            Box::new(JArray(self.0.clone()))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = sonic_rs::to_string(&self.0).unwrap();
            _ = out.write_str(&s);
            out.flush();
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn is_empty(&self) -> bool {
            self.0.is_empty()
        }

        pub fn get(&'a mut self, index: usize) -> Box<JValueRef<'a>> {
            if index < self.0.len() {
                Box::new(JValueRef(&self.0[index]))
            } else {
                Box::new(JValueRef(&NULL_VALUE))
            }
        }

        pub fn iter(&'a mut self) -> Box<JValueIter<'a>> {
            Box::new(JValueIter(self.0.iter()))
        }
    }

    impl<'a> JArrayMut<'a> {
        pub fn clone(&self) -> Box<JArray> {
            Box::new(JArray(self.0.clone()))
        }

        pub fn to_string(&self, out: &mut DiplomatWrite) {
            let s = sonic_rs::to_string(&self.0).unwrap();
            _ = out.write_str(&s);
            out.flush();
        }

        pub fn push_null(&mut self) {
            self.0.push(Value::new());
        }

        pub fn push_bool(&mut self, value: bool) {
            self.0.push(Value::from(value));
        }

        pub fn push_i64(&mut self, value: i64) {
            self.0.push(Value::from(value));
        }

        pub fn push_u64(&mut self, value: u64) {
            self.0.push(Value::from(value));
        }

        pub fn push_f64(&mut self, value: f64) {
            self.0.push(Number::from_f64(value).unwrap());
        }

        pub fn push_str(&mut self, value: &DiplomatStr) {
            let value = unsafe { std::str::from_utf8_unchecked(value) };
            self.0.push(Value::from_str(value).unwrap());
        }

        pub fn push_value(&mut self, value: &JValue) {
            self.0.push(value.0.clone());
        }

        pub fn push_object(&mut self, value: &JObject) {
            self.0.push(value.0.clone());
        }

        pub fn push_array(&mut self, value: &JArray) {
            self.0.push(value.0.clone());
        }

        pub fn insert(&mut self, index: usize, value: &JValue) {
            self.0.insert(index, value.0.clone());
        }

        pub fn pop(&mut self) -> Box<JValue> {
            let v = self.0.pop();
            if let Some(v) = v {
                Box::new(JValue(v))
            } else {
                Box::new(JValue(Value::new()))
            }
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn is_empty(&self) -> bool {
            self.0.is_empty()
        }

        pub fn clear(&mut self) {
            self.0.clear();
        }

        pub fn remove(&mut self, index: usize) {
            if index < self.0.len() {
                self.0.remove(index);
            }
        }

        pub fn get(&'a mut self, index: usize) -> Box<JValueRef<'a>> {
            if index < self.0.len() {
                Box::new(JValueRef(&mut self.0[index]))
            } else {
                Box::new(JValueRef(&NULL_VALUE))
            }
        }

        pub fn get_mut(&'a mut self, index: usize) -> Box<JValueMut<'a>> {
            let v = self.0.get_mut(index).unwrap();
            Box::new(JValueMut(v))
        }

        pub fn iter(&'a mut self) -> Box<JValueIter<'a>> {
            Box::new(JValueIter(self.0.iter()))
        }

        pub fn iter_mut(&'a mut self) -> Box<JValueIterMut<'a>> {
            Box::new(JValueIterMut(self.0.iter_mut()))
        }
    }

    impl JKeysIter {
        pub fn next(&mut self, out: &mut DiplomatWrite) {
            if let Some(s) = self.0.pop() {
                _ = out.write_str(&s);
                out.flush();
            } else {
                _ = out.write_str("");
                out.flush();
            }
        }

        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn get(&self, index: usize, default: &DiplomatStr, out: &mut DiplomatWrite) {
            if index < self.0.len() {
                let s = &self.0[index];
                _ = out.write_str(s);
                out.flush();
            } else {
                let default = unsafe { std::str::from_utf8_unchecked(default) };
                _ = out.write_str(default);
                out.flush();
            }
        }
    }

    impl<'a> JObjectIter<'a> {
        pub fn next(&'a mut self) -> Box<JKeyValueRef<'a>> {
            let pair = self.0.next();
            if let Some((key, value)) = pair {
                Box::new(JKeyValueRef(key, value))
            } else {
                Box::new(JKeyValueRef(&"", &NULL_VALUE))
            }
        }
    }

    impl<'a> JValueIter<'a> {
        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn next(&mut self) -> Box<JValueRef<'a>> {
            Box::new(JValueRef(self.0.next().unwrap_or(&NULL_VALUE)))
        }
    }

    impl<'a> JValueIterMut<'a> {
        pub fn len(&self) -> usize {
            self.0.len()
        }

        pub fn next(&mut self) -> Box<JValueMut<'a>> {
            Box::new(JValueMut(self.0.next().unwrap_or_else(|| {
                static mut TEMP_VALUE: Value = Value::new();
                unsafe { &mut *addr_of_mut!(TEMP_VALUE) }
            })))
        }
    }

    impl<'a> JObjectIterMut<'a> {
        pub fn next(&'a mut self) -> Box<JKeyValueMut<'a>> {
            let pair = self.0.next().unwrap_or_else(|| {
                static mut TEMP_PAIR: (&str, Value) = ("", Value::new());
                unsafe { (&mut TEMP_PAIR.0, &mut TEMP_PAIR.1) }
            });
            Box::new(JKeyValueMut(pair.0, pair.1))
        }
    }

    impl<'a> JKeyValueRef<'a> {
        pub fn get_key(&self, out: &mut DiplomatWrite) {
            _ = out.write_str(self.0);
            out.flush();
        }

        pub fn get_value(&'a self) -> Box<JValueRef<'a>> {
            Box::new(JValueRef(self.1))
        }
    }

    impl<'a> JKeyValueMut<'a> {
        pub fn get_key(&self, out: &mut DiplomatWrite) {
            _ = out.write_str(self.0);
            out.flush();
        }

        pub fn get_value_mut(&'a mut self) -> Box<JValueMut<'a>> {
            Box::new(JValueMut(self.1))
        }
    }
}

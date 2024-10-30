use std::path::Path;

use diplomat_tool::DocsUrlGenerator;

pub fn main() {
    diplomat_tool::gen(
        Path::new("sonic_rs_bindings/src/lib.rs"),
        "mojo",
        Path::new("sonic/internal"),
        &DocsUrlGenerator::default(),
        None,
        false,
    )
    .unwrap();
}

#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Step 1: Compile the sonic-rs library
echo "Compiling the sonic-rs library..."
cd sonic_rs_bindings/
cargo build --release
cd ../

# Step 2: Generate bindings for sonic-rs
echo "Generating bindings for sonic-rs..."
cd ./generator/
cargo run generator
cd ../

# Step 3: Update the files in the internal directory to use the correct library name
echo "Updating internal files..."
sed -i 's/libXXX/libsonic/g' ./sonic/internal/diplomat_runtime.mojo

# Step 4: Copy the compiled .so file to the current directory
echo "Copying the compiled .so file..."
cp ./sonic_rs_bindings/target/release/libsonic.so ./

echo "Build completed successfully!"

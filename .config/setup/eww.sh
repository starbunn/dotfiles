#!/bin/bash

rustup component add rustc
rustup toolchain install nightly --component cargo
git clone https://github.com/elkowar/eww
cd eww
cargo build --release
cd target/release
chmod a+x ./eww
mv ./eww $HOME/bin

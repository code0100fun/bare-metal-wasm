@echo off

SET TARGET=wasm32-unknown-unknown
SET BINARY=target\%TARGET%\release\bare_metal_wasm.wasm
SET OUT=www\bare_metal_wasm.wasm

cargo build --target %TARGET% --release

REM Strip panic handlers (to reduce size)
wasm-snip --snip-rust-fmt-code --snip-rust-panicking-code -o %BINARY% %BINARY%

REM Remove debug symbols
wasm-strip %BINARY%

REM Apply optimizations
wasm-opt -o %BINARY% -Oz %BINARY%

mkdir www
copy %BINARY% %OUT%
dir www\bare_metal_wasm.wasm
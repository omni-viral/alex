if [ -z "$1" ]
then
    echo "Usage: build-wasm32.sh <example-name>"
else
    cargo build --examples --target=wasm32-unknown-unknown
    wasm-bindgen --target web --out-dir "$(dirname $0)/web/generated" --debug --no-typescript "$(dirname $0)/../target/wasm32-unknown-unknown/debug/examples/$1.wasm"
fi

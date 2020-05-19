build:
	mkdir -p build
test: build
	mkdir -p build/test
test/Exception: test Exception/test/*.pony
	stable fetch
	stable env ponyc Exception/test -o build/test --debug
test/execute: test/Exception
	./build/test/test
clean:
	rm -rf build

.PHONY: clean test

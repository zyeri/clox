BUILD_DIR := build

default: clox

# Compile a debug build of clox.
debug:
	@ $(MAKE) -f util/c.make NAME=cloxd MODE=debug SOURCE_DIR=src

# Run the tests for the final versions of clox and jlox.
test: debug
	@ ./util/test.py clox

# Run the tests for the final version of clox.
test_clox: debug
	@ ./util/test.py clox

# Run the tests for every chapter's version of clox.
test_c: debug
	@ ./util/test.py c

# Run the tests for every chapter's version of clox and jlox.
test_all: debug
	@ ./util/test.py all

# Remove all build outputs and intermediate files.
clean:
	@ rm -rf $(BUILD_DIR)
	@ rm clox

# Compile the C interpreter.
clox:
	@ $(MAKE) -f util/c.make NAME=clox MODE=release SOURCE_DIR=src
	@ cp build/clox clox # For convenience, copy the interpreter to the top level.

.PHONY: clean clox debug default test test_all test_c

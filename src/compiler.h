#ifndef clox_compiler_h
#define clox_compiler_h

#include "object.h"
#include "vm.h"

static void advance();
bool compile(const char* source, Chunk* chunk);

#endif

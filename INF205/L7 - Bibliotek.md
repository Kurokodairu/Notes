
## Three Stages of Library Use

| Stage | What's needed | Key detail |
|---|---|---|
| **Compile time** | Library **headers** (`#include`) | Full source code not needed; library can be in another language |
| **Linking** | Shared object file (`*.so`) | Executable does **not** contain the library's object code |
| **Execution** | Shared object must be findable | If `.so` is missing at runtime, program won't run |

## Compiler Flags (g++)

| Flag | Purpose | Note |
|---|---|---|
| `-I/path/to/headers` | Include path (compile time) | Capital **I** |
| `-L/path/to/lib` | Library search path (link time) | Capital **L** |
| `-lname` | Link against `libname.so` | Lowercase **l** |
| `-fPIC` | Position-independent code (for shared libs) | Required when building `.so` |
| `-shared` | Create a shared library | |

## Creating a Shared Library

```bash
g++ -fPIC -c -o first.o first.cpp
g++ -fPIC -c -o second.o second.cpp
g++ -shared -o libname.so first.o second.o
```

## Using a Shared Library

```bash
# Compile
g++ -c -std=c++17 -I/path/to/headers -o main.o main.cpp

# Link
g++ -std=c++17 -o myapp main.o -L/path/to/lib -lname
```

## Runtime: Finding the `.so`

- Must be in a standard library path, **or**
- Set `$LD_LIBRARY_PATH` to include the `.so` location:

```bash
export LD_LIBRARY_PATH=/path/to/lib:$LD_LIBRARY_PATH
```

## CMake Basics

- Config file: **`CMakeLists.txt`**
- Typical workflow:

```bash
cmake .
make
sudo make install
```

- CMake **generates** a `Makefile` for GNU make
- Useful for complex dependencies, cross-compiling, diverse systems
- GUI available: `cmake-gui`

## Example: Magick++ (ImageMagick)

Some libraries provide config tools that output the right flags:

```bash
# Compile flags
Magick++-config --cppflags

# Linker flags
Magick++-config --libs
```

> **Key takeaway:** Libraries are pre-compiled object code. You need headers at compile time, `.so` at link time, and `.so` again at runtime.
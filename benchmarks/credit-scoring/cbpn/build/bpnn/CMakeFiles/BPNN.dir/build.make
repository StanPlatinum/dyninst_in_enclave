# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build

# Include any dependencies generated for this target.
include bpnn/CMakeFiles/BPNN.dir/depend.make

# Include the progress variables for this target.
include bpnn/CMakeFiles/BPNN.dir/progress.make

# Include the compile flags for this target's objects.
include bpnn/CMakeFiles/BPNN.dir/flags.make

bpnn/CMakeFiles/BPNN.dir/bpnn.c.o: bpnn/CMakeFiles/BPNN.dir/flags.make
bpnn/CMakeFiles/BPNN.dir/bpnn.c.o: ../bpnn/bpnn.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object bpnn/CMakeFiles/BPNN.dir/bpnn.c.o"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && /home/weijliu/llvm-mc/build/bin/clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/BPNN.dir/bpnn.c.o   -c /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn/bpnn.c

bpnn/CMakeFiles/BPNN.dir/bpnn.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/BPNN.dir/bpnn.c.i"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && /home/weijliu/llvm-mc/build/bin/clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn/bpnn.c > CMakeFiles/BPNN.dir/bpnn.c.i

bpnn/CMakeFiles/BPNN.dir/bpnn.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/BPNN.dir/bpnn.c.s"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && /home/weijliu/llvm-mc/build/bin/clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn/bpnn.c -o CMakeFiles/BPNN.dir/bpnn.c.s

bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.requires:

.PHONY : bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.requires

bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.provides: bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.requires
	$(MAKE) -f bpnn/CMakeFiles/BPNN.dir/build.make bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.provides.build
.PHONY : bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.provides

bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.provides.build: bpnn/CMakeFiles/BPNN.dir/bpnn.c.o


bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o: bpnn/CMakeFiles/BPNN.dir/flags.make
bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o: ../bpnn/bpnn_fit.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && /home/weijliu/llvm-mc/build/bin/clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/BPNN.dir/bpnn_fit.c.o   -c /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn/bpnn_fit.c

bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/BPNN.dir/bpnn_fit.c.i"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && /home/weijliu/llvm-mc/build/bin/clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn/bpnn_fit.c > CMakeFiles/BPNN.dir/bpnn_fit.c.i

bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/BPNN.dir/bpnn_fit.c.s"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && /home/weijliu/llvm-mc/build/bin/clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn/bpnn_fit.c -o CMakeFiles/BPNN.dir/bpnn_fit.c.s

bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.requires:

.PHONY : bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.requires

bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.provides: bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.requires
	$(MAKE) -f bpnn/CMakeFiles/BPNN.dir/build.make bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.provides.build
.PHONY : bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.provides

bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.provides.build: bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o


# Object files for target BPNN
BPNN_OBJECTS = \
"CMakeFiles/BPNN.dir/bpnn.c.o" \
"CMakeFiles/BPNN.dir/bpnn_fit.c.o"

# External object files for target BPNN
BPNN_EXTERNAL_OBJECTS =

bpnn/libBPNN.a: bpnn/CMakeFiles/BPNN.dir/bpnn.c.o
bpnn/libBPNN.a: bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o
bpnn/libBPNN.a: bpnn/CMakeFiles/BPNN.dir/build.make
bpnn/libBPNN.a: bpnn/CMakeFiles/BPNN.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C static library libBPNN.a"
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && $(CMAKE_COMMAND) -P CMakeFiles/BPNN.dir/cmake_clean_target.cmake
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BPNN.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bpnn/CMakeFiles/BPNN.dir/build: bpnn/libBPNN.a

.PHONY : bpnn/CMakeFiles/BPNN.dir/build

bpnn/CMakeFiles/BPNN.dir/requires: bpnn/CMakeFiles/BPNN.dir/bpnn.c.o.requires
bpnn/CMakeFiles/BPNN.dir/requires: bpnn/CMakeFiles/BPNN.dir/bpnn_fit.c.o.requires

.PHONY : bpnn/CMakeFiles/BPNN.dir/requires

bpnn/CMakeFiles/BPNN.dir/clean:
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn && $(CMAKE_COMMAND) -P CMakeFiles/BPNN.dir/cmake_clean.cmake
.PHONY : bpnn/CMakeFiles/BPNN.dir/clean

bpnn/CMakeFiles/BPNN.dir/depend:
	cd /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/bpnn /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn /home/weijliu/elf-respect/benchmarks/credit-scoring/cbpn/build/bpnn/CMakeFiles/BPNN.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : bpnn/CMakeFiles/BPNN.dir/depend


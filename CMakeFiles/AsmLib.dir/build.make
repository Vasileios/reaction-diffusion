# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.10.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.10.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion

# Include any dependencies generated for this target.
include CMakeFiles/AsmLib.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/AsmLib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/AsmLib.dir/flags.make

CMakeFiles/AsmLib.dir/src/laplace.nasm.o: CMakeFiles/AsmLib.dir/flags.make
CMakeFiles/AsmLib.dir/src/laplace.nasm.o: src/laplace.nasm
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM_NASM object CMakeFiles/AsmLib.dir/src/laplace.nasm.o"
	/usr/local/bin/nasm $(ASM_NASM_INCLUDES) $(ASM_NASM_FLAGS) -f macho64 -o CMakeFiles/AsmLib.dir/src/laplace.nasm.o /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion/src/laplace.nasm

CMakeFiles/AsmLib.dir/src/laplace.nasm.o.requires:

.PHONY : CMakeFiles/AsmLib.dir/src/laplace.nasm.o.requires

CMakeFiles/AsmLib.dir/src/laplace.nasm.o.provides: CMakeFiles/AsmLib.dir/src/laplace.nasm.o.requires
	$(MAKE) -f CMakeFiles/AsmLib.dir/build.make CMakeFiles/AsmLib.dir/src/laplace.nasm.o.provides.build
.PHONY : CMakeFiles/AsmLib.dir/src/laplace.nasm.o.provides

CMakeFiles/AsmLib.dir/src/laplace.nasm.o.provides.build: CMakeFiles/AsmLib.dir/src/laplace.nasm.o


# Object files for target AsmLib
AsmLib_OBJECTS = \
"CMakeFiles/AsmLib.dir/src/laplace.nasm.o"

# External object files for target AsmLib
AsmLib_EXTERNAL_OBJECTS =

libAsmLib.a: CMakeFiles/AsmLib.dir/src/laplace.nasm.o
libAsmLib.a: CMakeFiles/AsmLib.dir/build.make
libAsmLib.a: CMakeFiles/AsmLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking ASM_NASM static library libAsmLib.a"
	$(CMAKE_COMMAND) -P CMakeFiles/AsmLib.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AsmLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/AsmLib.dir/build: libAsmLib.a

.PHONY : CMakeFiles/AsmLib.dir/build

CMakeFiles/AsmLib.dir/requires: CMakeFiles/AsmLib.dir/src/laplace.nasm.o.requires

.PHONY : CMakeFiles/AsmLib.dir/requires

CMakeFiles/AsmLib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/AsmLib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/AsmLib.dir/clean

CMakeFiles/AsmLib.dir/depend:
	cd /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion /Users/vasilis/Documents/Projects/emacs_gpp/reaction-diffusion/CMakeFiles/AsmLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/AsmLib.dir/depend

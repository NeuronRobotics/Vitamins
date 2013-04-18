# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/hpham/the-technocopia-project/third-party/free-cad

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hpham/the-technocopia-project/third-party/free-cad-build

# Include any dependencies generated for this target.
include src/Mod/Image/App/CMakeFiles/Image.dir/depend.make

# Include the progress variables for this target.
include src/Mod/Image/App/CMakeFiles/Image.dir/progress.make

# Include the compile flags for this target's objects.
include src/Mod/Image/App/CMakeFiles/Image.dir/flags.make

Mod/Image/Init.py: /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/Init.py
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hpham/the-technocopia-project/third-party/free-cad-build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating ../../../../Mod/Image/Init.py"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/cmake -E copy /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/Init.py /home/hpham/the-technocopia-project/third-party/free-cad-build/Mod/Image/Init.py

src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o: src/Mod/Image/App/CMakeFiles/Image.dir/flags.make
src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o: /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImageBase.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hpham/the-technocopia-project/third-party/free-cad-build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Image.dir/ImageBase.cpp.o -c /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImageBase.cpp

src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Image.dir/ImageBase.cpp.i"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImageBase.cpp > CMakeFiles/Image.dir/ImageBase.cpp.i

src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Image.dir/ImageBase.cpp.s"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImageBase.cpp -o CMakeFiles/Image.dir/ImageBase.cpp.s

src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.requires:
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.requires

src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.provides: src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.requires
	$(MAKE) -f src/Mod/Image/App/CMakeFiles/Image.dir/build.make src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.provides.build
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.provides

src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.provides.build: src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o

src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o: src/Mod/Image/App/CMakeFiles/Image.dir/flags.make
src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o: /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImagePlane.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hpham/the-technocopia-project/third-party/free-cad-build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Image.dir/ImagePlane.cpp.o -c /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImagePlane.cpp

src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Image.dir/ImagePlane.cpp.i"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImagePlane.cpp > CMakeFiles/Image.dir/ImagePlane.cpp.i

src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Image.dir/ImagePlane.cpp.s"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/ImagePlane.cpp -o CMakeFiles/Image.dir/ImagePlane.cpp.s

src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.requires:
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.requires

src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.provides: src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.requires
	$(MAKE) -f src/Mod/Image/App/CMakeFiles/Image.dir/build.make src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.provides.build
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.provides

src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.provides.build: src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o

src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o: src/Mod/Image/App/CMakeFiles/Image.dir/flags.make
src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o: /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/PreCompiled.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hpham/the-technocopia-project/third-party/free-cad-build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Image.dir/PreCompiled.cpp.o -c /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/PreCompiled.cpp

src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Image.dir/PreCompiled.cpp.i"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/PreCompiled.cpp > CMakeFiles/Image.dir/PreCompiled.cpp.i

src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Image.dir/PreCompiled.cpp.s"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/PreCompiled.cpp -o CMakeFiles/Image.dir/PreCompiled.cpp.s

src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.requires:
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.requires

src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.provides: src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.requires
	$(MAKE) -f src/Mod/Image/App/CMakeFiles/Image.dir/build.make src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.provides.build
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.provides

src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.provides.build: src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o

src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o: src/Mod/Image/App/CMakeFiles/Image.dir/flags.make
src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o: /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/AppImage.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hpham/the-technocopia-project/third-party/free-cad-build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Image.dir/AppImage.cpp.o -c /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/AppImage.cpp

src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Image.dir/AppImage.cpp.i"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/AppImage.cpp > CMakeFiles/Image.dir/AppImage.cpp.i

src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Image.dir/AppImage.cpp.s"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App/AppImage.cpp -o CMakeFiles/Image.dir/AppImage.cpp.s

src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.requires:
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.requires

src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.provides: src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.requires
	$(MAKE) -f src/Mod/Image/App/CMakeFiles/Image.dir/build.make src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.provides.build
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.provides

src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.provides.build: src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o

# Object files for target Image
Image_OBJECTS = \
"CMakeFiles/Image.dir/ImageBase.cpp.o" \
"CMakeFiles/Image.dir/ImagePlane.cpp.o" \
"CMakeFiles/Image.dir/PreCompiled.cpp.o" \
"CMakeFiles/Image.dir/AppImage.cpp.o"

# External object files for target Image
Image_EXTERNAL_OBJECTS =

Mod/Image/Image.so: src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o
Mod/Image/Image.so: src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o
Mod/Image/Image.so: src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o
Mod/Image/Image.so: src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o
Mod/Image/Image.so: src/Mod/Image/App/CMakeFiles/Image.dir/build.make
Mod/Image/Image.so: lib/libFreeCADApp.so
Mod/Image/Image.so: lib/libFreeCADBase.so
Mod/Image/Image.so: /usr/lib/libpython2.7.so
Mod/Image/Image.so: /usr/lib/x86_64-linux-gnu/libxerces-c.so
Mod/Image/Image.so: /usr/lib/x86_64-linux-gnu/libQtCore.so
Mod/Image/Image.so: /usr/lib/x86_64-linux-gnu/libz.so
Mod/Image/Image.so: /usr/lib/libboost_filesystem-mt.so
Mod/Image/Image.so: /usr/lib/libboost_program_options-mt.so
Mod/Image/Image.so: /usr/lib/libboost_regex-mt.so
Mod/Image/Image.so: /usr/lib/libboost_signals-mt.so
Mod/Image/Image.so: /usr/lib/libboost_system-mt.so
Mod/Image/Image.so: /usr/lib/libboost_thread-mt.so
Mod/Image/Image.so: src/Mod/Image/App/CMakeFiles/Image.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../../../Mod/Image/Image.so"
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Image.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/Mod/Image/App/CMakeFiles/Image.dir/build: Mod/Image/Image.so
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/build

src/Mod/Image/App/CMakeFiles/Image.dir/requires: src/Mod/Image/App/CMakeFiles/Image.dir/ImageBase.cpp.o.requires
src/Mod/Image/App/CMakeFiles/Image.dir/requires: src/Mod/Image/App/CMakeFiles/Image.dir/ImagePlane.cpp.o.requires
src/Mod/Image/App/CMakeFiles/Image.dir/requires: src/Mod/Image/App/CMakeFiles/Image.dir/PreCompiled.cpp.o.requires
src/Mod/Image/App/CMakeFiles/Image.dir/requires: src/Mod/Image/App/CMakeFiles/Image.dir/AppImage.cpp.o.requires
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/requires

src/Mod/Image/App/CMakeFiles/Image.dir/clean:
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App && $(CMAKE_COMMAND) -P CMakeFiles/Image.dir/cmake_clean.cmake
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/clean

src/Mod/Image/App/CMakeFiles/Image.dir/depend: Mod/Image/Init.py
	cd /home/hpham/the-technocopia-project/third-party/free-cad-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hpham/the-technocopia-project/third-party/free-cad /home/hpham/the-technocopia-project/third-party/free-cad/src/Mod/Image/App /home/hpham/the-technocopia-project/third-party/free-cad-build /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App /home/hpham/the-technocopia-project/third-party/free-cad-build/src/Mod/Image/App/CMakeFiles/Image.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/Mod/Image/App/CMakeFiles/Image.dir/depend


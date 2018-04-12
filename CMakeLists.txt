################################################################################
#23456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
#
#  reaction-diffusion - 2D reaction-diffusion simulation pitting compiler-tuned
#                       vs hand-tuned x86/SIMD-assembly code
#
#  Copyright 2016-2017 Mirco Müller
#
#  Author(s):
#    Mirco "MacSlow" Müller <macslow@gmail.com>
#
#  This program is free software: you can redistribute it and/or modify it
#  under the terms of the GNU General Public License version 3, as published
#  by the Free Software Foundation.
#
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranties of
#  MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
#  PURPOSE.  See the GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

cmake_minimum_required(VERSION 3.8)

#cmake_minimum_required (VERSION 2.8.12)
project (reaction-diffusion)
###
# set (CMAKE_CXX_STANDARD 14)
# set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
# list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake_modules")
###
set (CMAKE_CXX_COMPILER "g++")

enable_language (ASM_NASM)
add_library (AsmLib src/laplace.nasm)

include (FindPkgConfig)
pkg_check_modules (SDL2 sdl2 REQUIRED)
include_directories (include ${SDL2_INCLUDE_DIRS})
#include_directories (include (/usr/bin/gcc))
###
# find_package(SDL2 REQUIRED)
# find_package(SDL2_image REQUIRED)
# find_package(SDL2_ttf REQUIRED)

# include_directories(${SDL2_INCLUDE_DIR}
#                     ${SDL2_IMAGE_INCLUDE_DIR}
#                     ${SDL2_TTF_INCLUDE_DIR})
# target_link_libraries(target ${SDL2_LIBRARY}
#                              ${SDL2_IMAGE_LIBRARIES}
#                              ${SDL2_TTF_LIBRARIES})
###

###
# find_package(OpenGL REQUIRED)
# if (OPENGL_FOUND)
#     include_directories(${OPENGL_INCLUDE_DIRS})
#     link_libraries(${OPENGL_LIBRARIES})
# endif()

# find_package(GLEW REQUIRED)
# if (GLEW_FOUND)
#     include_directories(${GLEW_INCLUDE_DIRS})
#     link_libraries(${GLEW_LIBRARIES})
#   endif()

#   find_package(SFML REQUIRED system window graphics network audio)
# if (SFML_FOUND)
#     include_directories(${SFML_INCLUDE_DIRS})
#     link_libraries(${SFML_LIBRARIES})
# endif()

# find_package(Threads REQUIRED)
# if (THREADS_FOUND)
#     link_libraries(Threads::Threads)
# endif()

# add_executable(game ${SOURCE_FILES})

###
add_compile_options(-std=c++14 -Werror -Wall -pedantic -fno-omit-frame-pointer -Ofast -march=native)
#add_compile_options(-std=c++14 -Werror -Wall -pedantic -fno-omit-frame-pointer -fsanitize=leak -fsanitize=address)

add_library (DisplayLib src/display.cpp)
add_library (BufferLib src/buffer.cpp)

add_executable (reaction-diffusion src/main.cpp)
target_link_libraries (reaction-diffusion
	DisplayLib
	BufferLib
	#-fsanitize=leak
	#-fsanitize=address
	AsmLib
	${SDL2_LDFLAGS}
	-pthread
	-s
)

add_custom_target (valgrind
	DEPENDS reaction-diffusion
	COMMAND valgrind --track-origins=yes --show-leak-kinds=all  --leak-check=full -v ./reaction-diffusion
)

add_custom_target (perf
	DEPENDS reaction-diffusion
	COMMAND perf stat ./reaction-diffusion
)

add_custom_target (report
	DEPENDS reaction-diffusion
	COMMAND perf record -g ./reaction-diffusion
	COMMAND perf report -g 'graph,0.5,caller' --sort comm,dso,sym
)

add_custom_target (tiny
	DEPENDS reaction-diffusion
	COMMAND gzip -cn9 ./reaction-diffusion >small
	COMMAND cat ../data/tiny ./small >compact
	COMMAND chmod +x ./compact
	COMMAND rm ./small ./reaction-diffusion
	COMMAND mv ./compact ./reaction-diffusion
)

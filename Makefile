OS:=$(shell uname -s)

ifndef NPROCS
ifeq ($(OS),Linux)
	NPROCS:=$(shell grep -c ^processor /proc/cpuinfo)
else ifeq ($(OS),Darwin)
	NPROCS:=$(shell sysctl hw.ncpu | awk '{print $$2}')
endif
endif

ifdef NPROCS
  EXTRA_OPTIONS:=-j${NPROCS}
endif

all:
	#make noasm
	make asm

noasm:
	cmake -H. -Bbuild-noasm
	cmake --build build-noasm -- ${EXTRA_OPTIONS}

asm:
	cmake -H. -Bbuild-asm -DWithOpenSSLASM=ON
	cmake --build build-asm -- ${EXTRA_OPTIONS}

clean:
	rm -rf build-asm build-noasm

.PHONY: asm noasm all clean

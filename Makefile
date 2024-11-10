# CC: defines the C compiler to use
# OPT: defines optimization level
# CFLAGS: defines compiler flags
# LFLAGS: defines library paths in addition to /usr/lib
# LIBS: defines libraries to use (eg: -lm for math library..Add multiple ones like so: -lm -lm2 -lm2)
# SOURCES: defines the source files for this project
# OBJFILES: defines the object files this projects needs
# MAIN: defines the name of the executable file
# $@: refers to 'target name'
# $<: refers to 'first prerequisit'


CC		= gcc
OPT		?= -O2
CFLAGS		= -std=c11 -Wall -Wextra -Werror -fmax-errors=10 $(OPT)
LFLAGS		= -L.
LIBS		?= 
SOURCES		:= $(wildcard *.c)
OBJFILES	:= $(SOURCES:.c=.o)
MAIN		?= program_name

.PHONY: all run clean

all: $(MAIN)

$(MAIN): $(OBJFILES)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJFILES) $(LFLAGS) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

run: $(MAIN)
	./$(MAIN)

clean: 
	rm -f $(OBJFILES) $(MAIN)

help:
	@echo "Available targets:"
	@echo "  all     - Build the executable"
	@echo "  run     - Execute the program (Specify args in the Makefile if they are needed)"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Display this help message"

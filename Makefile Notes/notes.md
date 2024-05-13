# [Makefile tutorial](https://makefiletutorial.com/)

## Makefiles **MUST** be indented using `TABS` not spaces or it'll fail 

## Makefile Syntax
- Consists of a set of `rules` that look like 

```Makefile
targets: prerequisites
	command
	command
	command
```

- Breakdown of syntax above
  - Targets
    - File names separated by spaces
    - Typically there's only one per rule
  - Commands
    - Series of steps used to make the target(s)
    - Need to start with `tab character`, not spaces
  - Prerequisites
    - File names separated by spaces 
    - These files need to exist `before` the commands for the target to are ran
    - Prerequisites are also called `dependences`

<br>

## The essence of Make

```Makefile
# Makefile Syntax
targets: prerequisites
	command
	command
	command

# Hello world example
hello:
	echo "Hello, World"
	echo "This line will print if the file hello does not exist."
```

- Breakdown of example
  - Have one target called `hello`
  - This target has two commands 
    - The echo(s)
  - And no prerequisites

### To run `make hello`
### When running 'make hello'
- As long as the file 'hello' doesn't exist, the `commands will run`
- If the 'hello' file does exist, the commands will NOT run
- In this context, `hello` is both a `target` and a `file`
  - Since the two are directly tied together
  - When a target is ran; specifically the commands of a target
    - The commands will create a file with the same `name` as the `target`
    - In this case:
      - `hello` target DOESN'T create the `hello` file

<br>

## Refer to `Hello World Makefile` for a basic example


## Typical Makefile stuff


### Compiling single C file

```c
// blah.c
int main() { return 0; }
```
### The Makefile that's needed
- Running `make` on it's own
- Since no target i supplied as an argument to the make command --> The first target ; blah, is ran
  - If ran for a second time, you'll get
    - `main.c is up to date`
    - If you try to modify main.c and run make again `nothing gets recompiled`
    - Must add prerequisite
```Makefile
# Hello world example
hello: (A pre-requisite would had been here)
	echo "Hello, World"
	echo "This line will print if the file hello does not exist."
```
- With prerequisite the following happens
  - First target selected since it's the first target is the default target
  - Has prerequisite of main.c
  - Make decides if it should run `main` target
    - It'll only run 
      - If `main` doesn't exist 
      - `main.c` is newer than `main`
      - Filesystem timestamps are used as proxies to determine if a file has changed or not
```Makefile
# No prerequsite
blah:
	cc blah.c -o blah

# Added prerequisite 
main: main.c
    cc main.c -o main

# CPP 'version'
main: main.cpp
    g++ main.cpp -o main

# Basic Makefile Syntax Reminder
targets: prerequisites
	command
	command
	command
```
# More examples

## Breakdown of example below
- Make selects target `blah`
- Make selects the target `blah`, because the first target is the default target
- `blah` requires `blah.o`, so make searches for the `blah.o target`
- `blah.o` requires `blah.c`, so make searches for the `blah.c target`
- `blah.c` has no dependencies, so the echo command is run
- The cc -c command is then run, because all of the blah.o dependencies are finished
- The top cc command is run, because all the blah dependencies are finished
- That's it : 
  - `blah` is a compiled c program
```makefile
# Makefile Syntax
targets: prerequisites
	command
	command
	command
######################################################################################################
blah: blah.o
	cc blah.o -o blah # Runs third

blah.o: blah.c
	cc -c blah.c -o blah.o # Runs second

# Typically blah.c would already exist, but I want to limit any additional required files
blah.c:
	echo "int main() { return 0; }" > blah.c # Runs first
```

## Deleting `blah.c` in the example above
- All three targets will rerun
- If you edit `blah.c`
  - The timestamp will change to be newer than `main.o`
  - The first two targets will run
  - No changes --> none of the targets will run

## Another example

```Makefile
some_file: other_file
	echo "This will always run, and runs second"
	touch some_file

other_file:
	echo "This will always run, and runs first"
```

# Make clean
- `clean` often used as `target`
  - Removes output of other targets
  - NOT a special word in Make
- `clean` is doing two things 
  - It's a target that's not first; the default
    - Also not a prerequisite, meaning it won't run unless you explicitly call `make clean`
  - Not intended to be a filename
    - If there is a file named `clean`, that target won't run
    - Which isn't want we want
      - The keyword `.PHONY` will be explained later

```Makefile
some_file: 
	touch some_file

clean:
	rm -f some_file
```

# Variables 
- Can only be `strings`
- Typically want to use `:=` but `=` also works

## Examples using variables
```Makefile

# Makefile Syntax
targets: prerequisites
	command
	command
	command

# Variable example

files := file1 file2
# When 'some_files' is built it echos the values of 'files' variable then touches 'some_file'
some_file: $(files)
	echo "Look at this variable: " $(files)
	touch some_file

file1:
	touch file1
file2:
	touch file2

clean:
	rm -f file1 file2 some_file
```

## Example using single/double quotes
- Single/double quotes don't mean anything in Make
- They're just characters assigned to a variable
```Makefile
a := one two   # a is set to the string "one two"
b := 'one two' # Not recommended. b is set to the string "'one two'"
all:
	printf '$a'
	printf $b
```


## Reference variables using `${}` or `$()`

```Makefile
x := dude

all:
	echo $(x)
	echo ${x}

	# Bad practice, but works
	echo $x 
```

# Targets 

## The `all` target
- If you want to make multiple tagets to run, make a `all` target
- Since it's the first rule listed
  - It'll run by default if make is called w/o specifying a target

```Makefile
all: one two three

one:
	touch one
two:
	touch two
three:
	touch three

clean:
	rm -f one two three
```

## Multiple targets
- When there's multiple targets for a rule, the commands will run for each target
- `$@` is a automatic variable that contains the `target name`
```Makefile
# Makefile Syntax
targets: prerequisites
	command
	command
	command

all: f1.o f2.o

f1.o f2.o:
	echo $@
# Equivalent to:
# f1.o:
#	 echo f1.o
# f2.o:
#	 echo f2.o
```

---

<br>

# Automatic Variable and Wildcards

## The Wildcard
- Both `*` and `%` are wildcards but they mean very different things 

### `*`
- Searches filesystem for matching `file names`
  - Recommended to wrap the `wildcard funcntion`
    - Example of wrapping the wildcard function : `thing_right := $(wildcard *.o)`
  - See below for example
	```Makefile
	# Remember
	# Makefile Syntax
	targets: prerequisites
		command
		command
		command
	
	# First example
	# Print out file information about every .c file
	print: $(wildcard *.c)
	ls -la  $?


	# Second example 
	thing_wrong := *.o # Don't do this! '*' will not get expanded
	thing_right := $(wildcard *.o)

	all: one two three four

	# Fails, because $(thing_wrong) is the string "*.o"
	one: $(thing_wrong)

	# Stays as *.o if there are no files that match this pattern :(
	two: *.o 

	# Works as you would expect! In this case, it does nothing.
	three: $(thing_right)

	# Same as rule three
	four: $(wildcard *.o)
	```

### In the first example
- `*` can be used in:
  - The target
  - Prerequisite
  - In the wildcard function
- Don't use `*` in the `variable definitions`
- Also keep in mind if `*` matches no files 
  - It's left as it is 
  - Not unless it's running in the wildcard function

### `%` Wildcard
- Super useful but confusing due to the variety of situations it can be used in
  - When used in : 
    - `Matching mode` : it matches one or more characters in a string
      - This match is called `The stem`
    - `Replacing mode` : it takes the `stem` that was matched and `replaces it with a string`
- Most often used in 
  - `Rule definitions`	
  - Some specific functions 

### Sections on examples of it being used
#### 1) [Static Pattern Rules](https://makefiletutorial.com/#static-pattern-rules)
#### 2) [Pattern Rules](https://makefiletutorial.com/#pattern-rules)
#### 3) [String Substitution](https://makefiletutorial.com/#string-substitution)
#### 4) [The vpath Directive](https://makefiletutorial.com/#the-vpath-directive)


### Another wildcard example

```Makefile
# Define variables
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
CC := gcc
CFLAGS := -Wall -Wextra -g

# Define sources and objects
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Define the target executable
TARGET := $(BIN_DIR)/myprogram

# Default target
all: $(TARGET)

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link object files into the target executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

# Clean rule to remove object files and the executable
clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGET)


```
## Usage:

- Save this as Makefile in your project directory.
- Place your .c files in the src directory.
- Run make in your terminal to compile source files and generate the executable.
- Run make clean to remove generated files.

## Explanation:
- SRC_DIR, OBJ_DIR, and BIN_DIR hold directory paths.
- CC is the compiler command.
- CFLAGS holds compiler flags.
- SRCS finds all .c files in src directory.
- OBJS converts each .c file to a .o file in obj directory.
- TARGET specifies the target executable.
- The all target depends on $(TARGET).
- The rule $(OBJ_DIR)/%.o: $(SRC_DIR)/%.c compiles each .c file.
- The rule $(TARGET): $(OBJS) links object files into the executable.
  - The clean rule removes object files and the executable.

## Automatic variables
- Reference towards other automatic variables : https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
```Makefile
hey: one two
	# Outputs "hey", since this is the target name
	echo $@

	# Outputs all prerequisites newer than the target
	echo $?

	# Outputs all prerequisites
	echo $^

	touch hey

one:
	touch one

two:
	touch two

clean:
	rm -f hey one two
```
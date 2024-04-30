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
    - Need to start with tab character, not spaces
  - Prerequisites
    - File names separated by spaces 
    - These files need to exist `before` the commands for the target to are ran
    - Are also called `dependences`

## The essence of Make

```Makefile
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
- The `hello` file can't exist
- If that's the case the commands will run
- If the file does exist, no commands will run
- These statements are in reference about `hello` being both a target and a file
  - Since the two are directly tied together
  - When a target is ran; specifically the commands of a target
    - The commands will create a file with the same `name` as the target
    - In this case:
      - `hello` target DOESN'T create the `hello` file

## Refer to `Hello World Makefile` for a basic example

## Typical Makefile stuff

### Compiling single C file

```c
// blah.c
int main() { return 0; }
```
### The Makefile that's needed
- Running `make` on it's own
- Since no target i ssupplied as an argument to the make command --> The first target ; blah, is ran
  - If ran for a second time, you'll get
    - `main.c is up to date`
    - If you try to modify main.c and run make again `nothing gets recompiled`
    - Must add prerequisite
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
## More examples

## Breakdown of example below
- Make selects target `blah`
- Make selects the target blah, because the first target is the default target
- blah requires blah.o, so make searches for the blah.o target
- blah.o requires blah.c, so make searches for the blah.c target
- blah.c has no dependencies, so the echo command is run
- The cc -c command is then run, because all of the blah.o dependencies are finished
- The top cc command is run, because all the blah dependencies are finished
- That's it: blah is a compiled c program
```makefile
blah: blah.o
	cc blah.o -o blah # Runs third

blah.o: blah.c
	cc -c blah.c -o blah.o # Runs second

# Typically blah.c would already exist, but I want to limit any additional required files
blah.c:
	echo "int main() { return 0; }" > blah.c # Runs first
```
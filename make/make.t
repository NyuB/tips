Setup
  $ cp -r ${TESTDIR}/* .

Make is a program to automate incremental file building according to their inter-dependency rules
It is based on a simple rule: an upstream dependency is considered 'changed' in regard to a downstream one if its last modification time is more recent

In this sample Makefile, we set up multiple targets named <letter> or <letter>-tests for illustration purpose. They all juste create file named after the target

By default, make execute the first defined target, here 'all' builds all targets
  $ make all
  [a]
  [a-tests]
  [b]
  [b-tests]
  [c]
  $ cat a
  a
When nothing changes, make does not rebuild anything
  $ make
  make: Nothing to be done for 'all'.
A 'clean' target is often defined to reset all built artifacts
  $ make clean
  $ cat a
  cat: a: No such file or directory
  [1]
By default, make looks for a 'Makefile' file in the current directory.
Another directory can be specified with '-C'. This can be usefull when calling other Makefile from within a make target recipe.
  $ mkdir nested
  $ printf "target:\n\t@echo nested" > nested/Makefile
  $ ls nested
  Makefile
  $ make -C nested | sed -n s+${PWD}+.+p
  make: Entering directory './nested'
  make: Leaving directory './nested'
The Makefile can also be specified with -f
  $ make -f Globbing.mk 
  globs/b.globtarget globs/a.globtarget

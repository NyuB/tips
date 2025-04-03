Make supports C-style includes. Although it wouldn't be maintenable to have large 'Makefile libraries', they can be usefull to share common rules or helpers.

Considering an example Makefile with a single target, commented with a '# Help message'
  $ printf "# Help message\ntarget:\n\techo dummy\n" > Makefile
  $ cat Makefile
  # Help message
  target:
  \techo dummy (esc)

For now, there is no help target in our Makefile
  $ make help
  make: *** No rule to make target 'help'.  Stop.
  [2]

Now let's include another makefile that defines a 'help' target scanning # comments
  $ printf "include ${TESTDIR}/help.mk" >> Makefile
  $ cat Makefile
  # Help message
  target:
  \techo dummy (esc)
  include /home/app/make/help.mk (no-eol)
  $ make help
  target:
  \t# Help message (esc)
  
Another containing a helper to define the correct python executable for 
  $ printf "\ninclude ${TESTDIR}/py.mk" >> Makefile
  $ printf "\nprint_python_version:" >> Makefile
  $ printf '\n\t$(PY) --version' >> Makefile
  $ cat Makefile
  # Help message
  target:
  \techo dummy (esc)
  include /home/app/make/help.mk
  include /home/app/make/py.mk
  print_python_version:
  \t$(PY) --version (no-eol) (esc)
  $ make print_python_version
  python3 --version
  Python 3.12.3

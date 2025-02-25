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
  $ echo "include ${TESTDIR}/help.mk" >> Makefile
  $ make help
  target:
  \t# Help message (esc)
  

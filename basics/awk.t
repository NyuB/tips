Setup
  $ cp -r ${TESTDIR}/resources resources

awk accepts programs under the form '/regex-pattern/{command}'
a pattern match triggers the execution of the command
when all patterns have been matched, the next line is processed
the {print} command ouputs the current line
  $ awk '/^#/{print}' resources/patterns.txt
  # One
  # Two
to stop trying patterns at first match, use "next" to process the next line immediatly
in the following pattern, the 'a:' line is matched twice
  $ awk '/^a/{print}/^[a-b]/{print}' resources/patterns.txt
  a
  a
  b
  $ awk '/^a/{ print; next }/^[a-b]/{print}' resources/patterns.txt
  a
  b

awk is available on most linux distribution, and even on windows, e.g. via chocolatey
this makes it quite usefull for portable helper scripts, e.g. in Makefile

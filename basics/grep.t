Setup
  $ cp -r ${TESTDIR}/resources resources

grep can be used to filter lines based on a pattern
  $ cat resources/lines.txt | grep 2
  #2

A file can be passed as argument
  $ grep 2 resources/lines.txt
  #2

Passing a directory with -R searches all files within this directory recursively
(-l flags prints only matching files' names)
  $ grep -l -R 1 resources | sort
  resources/lines.txt
  resources/nested/lines.txt

-v flag can be used to revert the logic and output lines not matching the pattern
  $ grep -v 2 resources/lines.txt
  #1
  #3
  #4

-B(efore) and -A(fter) options can be used to output lines surrouding the matching lines
  $ grep -A 1 -B 1 3 resources/lines.txt
  #2
  #3
  #4

Multiple pattern can be provided using the '\|' conjonction operator
  $ grep "1\|3" resources/lines.txt
  #1
  #3
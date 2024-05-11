Setup
  $ cp -r ${TESTDIR}/resources resources

Standard output can be redirected with >
For example to a file
  $ echo A
  A
  $ echo A >redirected.txt
  $ cat redirected.txt
  A
Redirecting to /dev/null is a way to 'swallow' the output
  $ echo A >/dev/null
The error output (2) must be redirected separately
  $ cat non-existing.txt >/dev/null
  cat: non-existing.txt: No such file or directory
  [1]
  $ cat non-existing.txt 2>/dev/null
  [1]
To completely hide a program output, redirect both standard (1) and error (2) output
Notice that, in previous examples, redirection without specifying the output (>/redirect) defaulted to (1>redirect)
  $ cat resources/a.txt non-existing.txt 1>/dev/null 2>/dev/null
  [1]
A more consise way to do this is redirecting the error output to the standard output (merging the two streams)
and the standard output to /dev/null
  $ cat resources/a.txt non-existing.txt 2>1 >/dev/null
  [1]

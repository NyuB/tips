grep can be used to filter lines based on a pattern
  $ cat ${TESTDIR}/lines.txt | grep 2
  #2

-v flag can be used to revert the logic and output lines not matching the pattern
  $ cat ${TESTDIR}/lines.txt | grep -v 2
  #1
  #3
  #4

-B(efore) and -A(fter) options can be used to output lines surrouding the matching lines
  $ cat ${TESTDIR}/lines.txt | grep 3 -A 1 -B 1
  #2
  #3
  #4
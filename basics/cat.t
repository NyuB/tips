Setup
  $ cp -r ${TESTDIR}/resources resources

cat is mostly used to display the content of a file
  $ cat resources/a.txt
  AAA

the name actually comes from 'concat' and it can indeed be used to concatenate multiple files
  $ cat resources/a.txt resources/b.txt
  AAA
  BBB
Setup
  $ cp -r ${TESTDIR}/resources resources

Quoting from GNU home page https://www.gnu.org/software/sed/:
'sed is typically used for extracting part of a file using pattern matching or substituting multiple occurrences of a string within a file.'

Replace a pattern from a given file
  $ cat resources/lines.txt
  #1
  #2
  #3
  #4
(-n avoids printing each pattern match)
  $ sed -n 's/#/O/p' resources/lines.txt
  O1
  O2
  O3
  O4
Modifiy the file 'in place' with -i/--in-place
  $ sed --in-place=.bkp 's/#/O/g' resources/lines.txt
  $ cat resources/lines.txt
  O1
  O2
  O3
  O4
If a suffix argument is provided to --in-place, a backup file is created with the supplied suffix
  $ cat resources/lines.txt.bkp
  #1
  #2
  #3
  #4
Restore file
  $ mv resources/lines.txt.bkp resources/lines.txt


Search for a range of line between two patterns (inclusive):
  $ sed -n '/2/,/4/p' resources/lines.txt
  #2
  #3
  #4

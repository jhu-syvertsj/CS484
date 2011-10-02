Course
  CS484 -- ruby and rails development JHU/APL

Program:
  Homework 2

Developers:
  Jim Schweiger   -- jim.schweiger@gmail.com
  James Syvertsen -- syvertsj.jhu@gmail.com

Usage:
  From command line type:
    # ruby homework2.rb [filename] [delimeter] [version]

Description:
  Extract, sort, and display domain names from text file.

Design(s):
  The code has some functionality that is common in typical scripts but 
  not necessary for the assignment: optional command line arguments, 
  utilization of classes, and enabling platform checks and system code 
  to better facilitate reading and verifying the output to the terminal:
  (ie: using the dos 'pause' command to keep the terminal from closing
  when running using a double-click.

  A text file, "homework_two_test.txt" is provided and will be read by 
  default if the file name is not provided on the command line. A different
  file may be provided as the first argument. 
  The second optional command argument is a delimeter, which, by default,
  is a space. The third optional command argument is whether to run the 
  standard version, which populated and read from a hash, or the "bonus"
  version which populated an array instead and used the 'inject' method
  to convert to the hash. Both seemed relevant ways to do it, so that
  was preserved and it allowed for the somewhat contrived use of a 'case'
  statement.

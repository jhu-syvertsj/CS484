
Program:
  homework 3  -- CS484: Ruby and Rails, JHU 

Description:
  parse csv file of student records, serialize student and course
  data into yaml file, and create API to select records from yaml object.

  ruby db_generator.rb -- main driver to read csv file
  students.csv         -- csv data file (provided as default)
  course.rb            -- defines Course class
  student.rb           -- defines Student class
  db_api.rb            -- defines DbApi class API to select yaml records 
  db_client.rb         -- (provided) will use methods from DbApi class
  homework3UI          -- ruby Tk interface to launch db_generator.rb and db_client.rb

Run: 
  # ruby homework3UI.rb

  To generate yaml file:
  # ruby db_generator.rb 

  To query yaml database:
  # ruby db_client.rb

  (All files must be in the same directory)


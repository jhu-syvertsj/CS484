
=begin
  
  Description:
    extract student data from csv text file and generate yaml file with data

  Run:
    # ruby db_generator.rb

=end

require_relative "student"
require_relative "course"
require 'yaml'
require 'csv'

class DbGenerator

  # courses
  courses = Array.new
  courses << Course.new("Intro to Java", "605.401") 
  courses << Course.new("Intro to Ruby", "605.402") 
  courses << Course.new("Intro to Rails", "605.403") 
  courses << Course.new("Advanced Rails", "605.404") 

  # open csv populate students
  reader = CSV.open("students.csv", "r")
  reader.shift

  students = Array.new 
  reader.each_with_index do |row,index|
    students << Student.new do |st| 
      st.student_id     = index +=1 
      st.first_name     = row[0]
      st.last_name      = row[1]
      st.city           = row[3]
      st.state          = row[4]
      st.email          = row[6]
      st.gender         = row[7]
      st.pounds         = row[9].to_i
      st.gpa            = (2.0 + 2 * rand).round(2) 
      st.taking_courses = courses.sample(rand(5)).join(", ")
    end
  end

  # serialize student data into yaml file
  File.open("university_db.yml", "w") {|file| YAML.dump(students, file) }

end

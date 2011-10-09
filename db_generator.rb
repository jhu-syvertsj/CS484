
=begin
  
  Program:
    homework3

  Description:
    extract student data from csv text file and generate yaml file with data

  Run:
    # ruby db_generator.rb

=end

require_relative "student"
require_relative "course"
require_relative "db_api"
require 'yaml'
require 'csv'

# array of courses
courses = Array.new
courses << Course.new("Ruby on Rails", "605.484") 
courses << Course.new("System Programming", "605.414") 
courses << Course.new("Enterprise Java", "605.784") 
courses << Course.new("Distributed Objects", "605.781") 

#puts "courses: "
#courses.each {|c| puts c.to_s }

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
      st.taking_courses = rand(5)
  end
end

students.each { |s| puts s.to_s }

exit 99

# serialize student data into yaml file
File.open("university_db.yml", "w") {|file| YAML.dump(students, file) }

# populate database using yaml file 
db = DbApi.new("university_db.yml")

# test DbApi methods using db_client:
system('ruby ./db_client')


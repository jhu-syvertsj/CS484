require_relative "db_api"

males = DbApi.select_students_where_gender "==", "male"
first_name_an = DbApi.select_students_where_first_name "=~", /an/i
less_than_190 = DbApi.select_students_where_pounds "<", 190
from_TX = DbApi.select_students_where_state "==", "TX"

puts "Number of males: #{males.size}" # => 1543
puts "Number of people whose first name contains 'an': #{first_name_an.size}" # => 433
puts "Number of people who weigh less than 190 pounds: #{less_than_190.size}" # => 1751
puts "Number of people from Texas: #{from_TX.size}" # => 218

puts

puts (males & first_name_an & less_than_190 & from_TX)

# SAMPLE OUTPUT
# Name: Morgan Scott (male from San Antonio, TX, weight: 177, GPA: 2.412161955930226)
# Name: Daniel Bellamy (male from Dallas, TX, weight: 170, GPA: 2.848627294939633)
#	  Courses: 605.403 - Intro to Rails, 605.404 - Advanced Rails
# Name: Alan Howard (male from Bryan, TX, weight: 145, GPA: 2.8406218298792907)
#	  Courses: 605.403 - Intro to Rails, 605.401 - Intro to Java
# Name: Alexander Dawson (male from Houston, TX, weight: 144, GPA: 2.0120928486538476)
#	  Courses: 605.405 - Machine Learning, 605.402 - Intro to Ruby, 605.404 - Advanced Rails
# Name: Andrew Simmons (male from Grand Prairie, TX, weight: 146, GPA: 3.309018439043608)
#	  Courses: 605.401 - Intro to Java, 605.404 - Advanced Rails
# Name: Frank Fleming (male from Smithville, TX, weight: 157, GPA: 2.3967990925106673)
# Name: Andrew Griffin (male from Austin, TX, weight: 139, GPA: 2.57652069755265)
#	  Courses: 605.405 - Machine Learning, 605.402 - Intro to Ruby, 605.403 - Intro to Rails, 605.404 - Advanced Rails, 605.401 - Intro to Java

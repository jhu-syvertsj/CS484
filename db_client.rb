require_relative "db_api"

males = DbApi.select_by_gender "male"
first_name_Andr = DbApi.select_by_first_name /andr/i
more_than_200 = DbApi.select_by_weight_more_than(200)

puts "Number of males: #{males.size}"
puts "Number of people whose first name contains 'Andr': #{first_name_Andr.size}"
puts "Number of people who weigh more than 200 pounds: #{more_than_200.size}"

puts

puts (males & first_name_Andr & more_than_200)


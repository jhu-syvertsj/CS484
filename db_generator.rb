
=begin
  
  Program:
    homework3

  Description:
    extract student data from csv text file and generate yml file with data

  Run:
    # ruby db_generator.rb [csv file]

  Usage:
    - csv file argument is optional
    - arg 0: input file will be "students.csv" by default
=end

require_relative "student"

class DbGenerator

  def initialize(file, del)
    @students = Student.new
    @filename  = file
    @delimeter = del
  end

  def parse_csv
  end

  def main
    parse_csv
  end

end


if __FILE__ == $0
  /linux/i =~ RUBY_PLATFORM ? host_os = "Linux" : host_os = "Windows"
  if host_os.eql?("Windows")
    system('pause')
    system('cls')
  else
    system('')
  end
  ( ARGV[0] and File.exists?(ARGV[0]) ) ? filename = ARGV[0] : filename = "students.csv" 
  DbGenerator.new(filename, ',').main 
  host_os.eql?("Windows") ?  system('pause') : system('')
end



require_relative "student"
require_relative "course"
require 'yaml'

class DbApi

  @@students = YAML.load_file("university_db.yml")

  def self.method_missing(method, *args)
    puts "a select call" if method =~ /^select*/i 
    puts "'#{method}' with params: (#{args.join(', ')})"
    yield "inside method_missing" if block_given?

  end

end

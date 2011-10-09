
require_relative "student"
require_relative "course"
require 'yaml'

class DbApi

  @@students  = YAML.load_file("university_db.yml")

  # ('new' is not called by db_client)
  #def initialize (yaml_file)
    #@@students  = YAML.load_file(yaml_file)
  #end

  def self.select_by_gender(gender)
    @@students.select {|s| s.gender.downcase.eql?(gender.downcase)  }
  end

  # (regex as parameter)
  def self.select_by_first_name(first_name)
    begin 
      @@students.select {|s| s.first_name =~ first_name }
    rescue TypeError => ex
      puts "#{ex.class}: non-regex parameter call to #{self.name}.#{__method__}"
    rescue Exception => ex
      puts "#{ex.class}: unknown exception in call to #{self.name}.#{__method__}"
    end
  end

  # (regex as parameter)
  def self.select_by_last_name(last_name)
    begin
      @@students.select {|s| s.last_name =~ last_name }
    rescue TypeError => ex
      puts "#{ex.class}: non-regex parameter call to #{self.name}.#{__method__}"
    rescue Exception => ex
      puts "#{ex.class}: unknown exception in call to #{self.name}.#{__method__}"
    end
  end

  def self.select_by_weight_more_than(pounds)
    @@students.select {|s| s.pounds > pounds }
  end

end

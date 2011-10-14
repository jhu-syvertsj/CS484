
require_relative "student"
require 'yaml'

class DbApi

  @@students ||= YAML.load_file("university_db.yml")

  def self.method_missing(method, *args)
    if method.to_s =~ /^select_(\w*)/i
      query = $1.split(/_/)
      case query.last
        when "gender" 
          @@students.select {|s| s.gender.downcase.eql?(args.last.downcase) }
        when "name"
          case query[query.size-2]
            when "first"
              @@students.select {|s| s.first_name =~ args.last}
            when "last"
              @@students.select {|s| s.last_name =~ args.last}
          end
        when "pounds"
          case args.first
            when ">"
              @@students.select {|s| s.pounds > args.last.to_f }
            when "<"
              @@students.select {|s| s.pounds < args.last.to_f }
            when "=="
              @@students.select {|s| s.pounds == args.last.to_f }
          end
        when "state"
          @@students.select {|s| s.state.upcase.eql?(args.last.upcase) }
        else puts " unsupported query: #{method.to_s} #{args.to_s}"
      end
    end
  end

end


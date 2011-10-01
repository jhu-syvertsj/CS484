
=begin
  
  Program:
    'homework2.rb'

  Description:
    extract, sort, and display domain names from text file

  Run:
    # ruby homework2.rb [input file] [delimeter] [version]

  Usage:
    - arguments are optional
    - arg 0: input file will be "homework_two_input.txt" by default
    - arg 1: delimeter will be ' ' by default
    - arg 2: version is either "standard" or "bonus", which uses 'inject' 
      method of enum class. Version is "bonus" by default.
=end


class MemoParser 

  def initialize(file, del, ver)
    @doc_array = Array.new
    @doc_hash  = Hash.new
    @domain_pattern = /@(\w*\.gov|\w*\.org|\w*\.net|\w*\.com)/i 
    @filename  = file
    @delimeter = del
    @version   = ver 
  end

  def populate_hash(token)
		@doc_hash.has_key?(token) ?  @doc_hash[token] +=1 : @doc_hash.store(token, 1) 
	end

  def parse_memo
    File.open(@filename, 'r').each do |line|
      line.split(@delimeter).each do |token|
        case @version
        when "bonus"
          if token =~ @domain_pattern then @doc_array << $1.downcase end   
        else 
          if token =~ @domain_pattern then populate_hash($1.downcase) end  
        end
      end
    end
  end

  def inject_hash 
    @doc_array.each do |element| 
	    count = @doc_array.inject(0) { |count, key| key.eql?(element) ? count +=1 : count }
			@doc_hash.store(element, count) 
    end
  end

  def print_results
    puts "Domain Results", "==========================="
    @doc_hash.to_a.sort.reverse.each do |key, value| 
      print key.to_s.rjust(15), ": ", value.to_s, " time(s)\n" 
    end
  end

  def main
    parse_memo
    inject_hash	
	  print_results
  end

end


if __FILE__ == $0
  /linux/i =~ RUBY_PLATFORM ? host_os = "Linux" : host_os = "Windows"
  if host_os.eql?("Windows")
    system('pause')
    system('cls')
  else
    system('clear')
  end
  ( ARGV[0] and File.exists?(ARGV[0]) ) ? filename = ARGV[0] : filename = "homework_two_input.txt" 
  ARGV[1] ?  delimeter = ARGV[1] : delimeter = ' '
  ARGV[2] ?  version   = ARGV[2] : version   = "bonus"
  MemoParser.new(filename, delimeter, version).main 
  host_os.eql?("Windows") ?  system('pause') : system('')
end



require 'httparty'

class Recipe
  
  include HTTParty  
  base_uri 'http://www.recipepuppy.com'
  default_params :output => "json"
  format :json

  def self.example
    #get("http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3")
    get("/api/?i=onions,garlic&q=omelet&p=3")
  end

  def self.for1(keyword)
    puts "\nretrieving recipes for #{keyword}: "
    get('/api', :query => {:ingredients => keyword})
  end

  def self.for(keyword)
    #options = { :query => {:title => keyword} }
    options = { :query => {:title => keyword}, :ingredients => keyword }
    puts "\nretrieving recipes for #{keyword}: "
    get('/api', options)
  end

  def self.fore(keyword)
    puts "\n#{base_uri} query for #{keyword}: "
    puts "\n#{base_uri} query for #{keyword.split.last}: "
    puts "\n#{base_uri} query for #{keyword.split.first}: "
    puts "\n#{base_uri} query for #{keyword.to_a.join(',')}: "
=begin
    case keyword.split.length
      when 1
        get('/api', :query => {:ingredients => keyword})
        #get("http://www.recipepuppy.com/api/?q=#{keyword}")
        #get("http://www.recipepuppy.com/api/?q=#{keyword}&p=1")
      when 2
        get('/api', :query => {:ingredients => keyword})
        #get("http://www.recipepuppy.com/api/?q=#{keyword.split.last}")
      else puts "not sure what to do yet"
    end
=end
  end

end


#puts Recipe.example
puts Recipe.for "chocolate"
puts Recipe.for "apple pie"

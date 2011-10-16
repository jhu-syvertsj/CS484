
require 'httparty'

class Recipe
  
  include HTTParty  
  base_uri 'http://www.recipepuppy.com'
  default_params :onlyImages => 1
  format :json

  def self.for(keyword)
    options = { :query => {:title => keyword}, :ingredients => keyword }
    puts "\nretrieving recipes for #{keyword}: "
    get('/api', options)
  end


end


puts Recipe.for "chocolate"
puts Recipe.for "apple pie"

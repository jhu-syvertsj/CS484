
require 'httparty'

class Recipe
  
  include HTTParty  
  base_uri 'http://www.recipepuppy.com'
  default_params :onlyImages => 1 # (from hw spec)
  format :json

  def self.for(keyword)
    #get('/api').inspect 
    puts "\nretrieving recipes for #{keyword}: "
    get('/api', :query => {:q => keyword})["results"]  # using 'q' from hw spec
  end


end


puts Recipe.for "chocolate"
puts
puts Recipe.for "apple pie"


class Recipe < ActiveRecord::Base
  
  include HTTParty  
  base_uri 'http://www.recipepuppy.com'
  default_params :onlyImages => 1
  format :json

  def self.for(keyword)
    get('/api', :query => {:q => keyword})["results"]
  end


end


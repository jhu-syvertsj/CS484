class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword] || "chocolate"
    @recipes = Recipe.for @keyword
    @time = Time.now
  end
end

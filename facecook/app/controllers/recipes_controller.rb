class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword] || "chocolate"
    @recipes = Recipe.for @keyword
  end
end

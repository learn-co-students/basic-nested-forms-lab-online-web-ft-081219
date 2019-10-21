class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # p params
     
  
  
    new_recipe = Recipe.create(recipe_params)
   new_recipe.ingredients_attributes =  params.require(:recipe).permit(ingredients_attributes: [:name,:quantity])
   p new_recipe.ingredients_attributes
  end

  private 
  def recipe_params 
   
    params.require(:recipe).permit(:title)
   
  end
end

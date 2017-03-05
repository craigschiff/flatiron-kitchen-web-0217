require 'pry'
class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipe = find_recipe
    @ingredients = Ingredient.all

  end

  def show
    @recipe = find_recipe
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.ingredients = Ingredient.where("id IN (?)", params[:recipe][:ingredient_ids])
    @recipe.save
    redirect_to @recipe
  end

  def update
    @recipe = find_recipe
    @recipe.update(recipe_params)
    @recipe.ingredients = Ingredient.where('id in (?)', params[:recipe][:ingredient_ids])
    @recipe.save
    redirect_to @recipe
  end

  def find_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end

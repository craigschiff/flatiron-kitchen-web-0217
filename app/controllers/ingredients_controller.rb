class IngredientsController < ApplicationController

  def index
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = find_ingredient
  end

  def show
    @ingredient = find_ingredient

  end

  def create
    if Ingredient.create(ingredient_params)
      redirect_to ingredient_path(Ingredient.last)
    else
      render :new
    end
  end

  def update
    @ingredient = find_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to edit_ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def find_ingredient
    Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end




end

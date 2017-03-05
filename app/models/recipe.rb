class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  # def ingredients(ingredients = nil)
  #   self.ingredients = ingredients
  # end
  #
  #
  # def ingredients=(ingredients)
  #   @ingredients = ingredients
  # end
  #
end

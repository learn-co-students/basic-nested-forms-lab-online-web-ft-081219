class Recipe < ActiveRecord::Base
  has_many :ingredients 
  def ingredients_attributes=(arg)
    arg.each do |key,val|
      
       val.each do |attribute| 
        new_ingredients = Ingredient.find_or_create_by(name: attribute["name"],quantity: attribute["quantity"])
         self.ingredients << new_ingredients
      end
    end
  end

  def ingredients_attributes 
    self.ingredients
  end
end

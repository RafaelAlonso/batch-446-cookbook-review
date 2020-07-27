class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end

# recipe = Recipe.new('pudim', 'gostoso')
# recipe.name

class Recipe
  attr_reader :name, :description, :prep_time

  def initialize(name, description, prep_time, done = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @done = done
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end

# recipe = Recipe.new('pudim', 'gostoso')
# recipe.name

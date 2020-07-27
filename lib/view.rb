class View
  def list_recipes(all_recipes)
    # all_recipes eh uma array de Recipes
    all_recipes.each_with_index do |recipe,ind|
      x = recipe.done? ? 'X' : ' '
      puts "#{ind + 1}: [#{x}] #{recipe.name} (#{recipe.prep_time})"
      puts "\t#{recipe.description}"
      puts ""
    end
  end

  # nao precisamos mais desse (temos sempre array de recipes a mostrar)
  # def list_recipe_names(recipe_names)
  #   # recipe_names eh uma array de Strings
  #   recipe_names.each_with_index do |name, ind|
  #     puts "#{ind + 1}: #{name}"
  #   end
  # end

  def ask_recipe(info)
    puts "Enter recipe #{info}:"
    return gets.chomp
  end

  def ask_recipe_position
    puts "Enter recipe position:"
    gets.chomp.to_i - 1
  end
end

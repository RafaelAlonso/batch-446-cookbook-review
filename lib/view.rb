class View

  def list_recipes(all_recipes)
    all_recipes.each_with_index do |recipe,ind|
      puts "#{ind + 1}: #{recipe.name}"
    end
  end

  def ask_recipe(info)
    puts "Enter recipe #{info}:"
    gets.chomp
  end

  def ask_recipe_position
    puts "Enter recipe position:"
    gets.chomp.to_i - 1
  end
end

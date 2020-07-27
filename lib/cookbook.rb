require_relative 'recipe'
require 'csv'

class Cookbook

  def initialize(csv_file_path)
    # csv_file_path eh o CAMINHO ate o arquivo
    # (nao o arquivo em si)
    @csv_file_path = csv_file_path
    @recipes = []

    # carregar receitas guardadas no csv
    load_recipes_from_csv
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
    save_recipes_to_csv
  end

  def mark_recipe(position_to_mark)
    recipe = @recipes[position_to_mark]
    recipe.mark_as_done!
    save_recipes_to_csv
  end

  def remove_recipe(delete_position)
    @recipes.delete_at(delete_position)
    save_recipes_to_csv
  end

  private

  def save_recipes_to_csv
    # abrir o arquivo em modo de escrita
    CSV.open(@csv_file_path, 'wb') do |csv|
      # pegar cada uma das recipes da array (@recipes)...
      @recipes.each do |recipe|
        # ... e colocar ela dentro do meu arquivo
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?]
      end
    end
  end

  def load_recipes_from_csv
    # abrir o arquivo e ler cada uma das linhas
    CSV.foreach(@csv_file_path) do |row|
      # row eh uma Array
      # ex.: ['Crumpets', 'Crumpets description']

      # criar uma receita com as infos da linha
      recipe_from_csv = Recipe.new(row[0], row[1], row[2], row[3])
      # armazenar a nova receita
      @recipes << recipe_from_csv
    end
  end

end

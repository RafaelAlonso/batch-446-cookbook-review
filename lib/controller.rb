require_relative 'view'
require_relative 'recipe'

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # recuperar a array de receitas do cookbook
    all_recipes = @cookbook.all
    # listar cada uma delas
    @view.list_recipes(all_recipes)
  end

  def create
    # criar uma nova receita e guardar no repo
    # pegar o nome
    recipe_name = @view.ask_recipe('name')
    # pegar a descricao
    recipe_desc = @view.ask_recipe('description')
    # criar a nova receita
    new_recipe = Recipe.new(recipe_name, recipe_desc)
    # pedir ao cookbook para guardar a nova receita
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # remover uma recipe do repositorio
    # listar receitas que temos guardado
    list
    # pegar a POSICAO da receita a ser removida
    position = @view.ask_recipe_position
    # pede para o cookbook deletar na posicao obtida
    @cookbook.remove_recipe(position)
  end

end

require_relative 'view'
require_relative 'recipe'
require_relative 'scraping_service'

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @service = ScrapingService.new
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
    # pegar o prep time
    recipe_prep = @view.ask_recipe('prep time')
    # criar a nova receita
    new_recipe = Recipe.new(recipe_name, recipe_desc, recipe_prep)
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

  def import
    # pegar o ingrediente que o user quer importar
    ingredient = @view.ask_recipe('ingredient to search')

    # pegar 5 receitas da internet do ingredinte escolhido
    recipes = @service.call(ingredient)

    # mostrar as receitas obtidas ao usuário
    @view.list_recipes(recipes)

    # perguntar qual das receitas user quer salvar
    position = @view.ask_recipe_position

    # pegar a receita que o user escolheu
    chosen_recipe = recipes[position]

    # salvar a receita escolhida no repositorio
    @cookbook.add_recipe(chosen_recipe)
  end

  def mark
    # listar as receitas para o user
    list
    # pegar o index da receita que user quer marcar
    position = @view.ask_recipe_position
    # marcar receita como feita
    @cookbook.mark_recipe(position)
  end

end

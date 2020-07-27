require 'open-uri'
require 'nokogiri'

class ScrapingService

  def call(ingredient)
    # pegar a url de onde iremos importar
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{ingredient}"

    # ========== PARSING ============
    # acessar a url em questao e coletar o html
    file = open(url).read # eh uma super string imanipulavel

    # transforma a super string em algo que conseguimos manipular
    doc = Nokogiri::HTML(file)
    # ===============================

    # ========== SCRAPING ===========
    # importar 5 receitas
    # procurar o nome e a descricao das receitas da internet
    recipe_elements = doc.search('.node-recipe') # array de elementos HTML

    # pegar o nome e a desc da receita de dentro de cada elemento
    recipes = [] # array de Recipes

    recipe_elements.first(5).each do |caixa|
      internet_name = caixa.search('.teaser-item__title a').text.strip # String
      internet_desc = caixa.search('.field-item').text.strip # String
      internet_prep = caixa.search('.teaser-item__info-item--total-time').text.strip # String

      recipes << Recipe.new(internet_name, internet_desc, internet_prep)
    end
    # ===============================
    return recipes
  end
end

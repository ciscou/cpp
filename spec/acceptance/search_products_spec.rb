require 'acceptance/acceptance_helper'

feature 'Search products', %q{
  In order to show only the products with a given name
  As an user
  I want to use the simple search form
} do

  background do
    category  = create :category, decoration_tag: "household"
    @product1 = create :product, category: category, decoration_code: "strokes", es_name: "un producto fantástico",       en_name: "an awesome product"
    @product2 = create :product, category: category, decoration_code: "poppy",   es_name: "otro producto guay",           en_name: "another cool product"
    @product3 = create :product, category: category, decoration_code: "strokes", es_name: "un producto fantástico nuevo", en_name: "a new awesome product", new_arrival: true
  end

  scenario 'should find products whose name matches search terms in Spanish' do
    visit homepage

    fill_in "q", with: "producto fantásticamente"
    click_button "Buscador"

    page.should have_css    ".product div.image-title", text: @product1.es_name
    page.should have_no_css ".product div.image-title", text: @product2.es_name
    page.should have_css    ".product div.image-title", text: @product3.es_name
  end

  scenario 'should find products by decoration' do
    visit homepage

    click_link "Trazos (2)"

    page.should have_css    ".product div.image-title", text: @product1.es_name
    page.should have_no_css ".product div.image-title", text: @product2.es_name
    page.should have_css    ".product div.image-title", text: @product3.es_name
  end

  scenario 'should find products whose name matches search terms in other languages' do
    visit homepage(locale: :en)

    fill_in "q", with: "awesomeness product"
    click_button "Search"

    page.should have_css    ".product div.image-title", text: @product1.en_name
    page.should have_no_css ".product div.image-title", text: @product2.en_name
    page.should have_css    ".product div.image-title", text: @product3.en_name
  end

end

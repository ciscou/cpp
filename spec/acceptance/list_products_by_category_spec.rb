require 'acceptance/acceptance_helper'

feature 'List products by category', %q{
  In order to show only the products in a given category
  As an user
  I want to select a category in the menu
} do

  scenario 'with two products, one of them in selected category' do
    product1 = Factory :product
    product2 = Factory :product

    visit homepage

    click_link product1.category.name

    page.should have_css    ".product div.image-title", :text => product1.name
    page.should have_no_css ".product div.image-title", :text => product2.name
  end

end

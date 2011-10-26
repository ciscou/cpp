require 'acceptance/acceptance_helper'

feature 'Search products', %q{
  In order to filter products by category
  As an user
  I want to select a category in the menu
} do

  scenario 'with two products, one of them matches search criteria' do
    product1 = Factory :product, :name => "an awesome product"
    product2 = Factory :product, :name => "another cool product"

    visit homepage

    fill_in "q", :with => "awesome product"
    click_button "Buscar"

    page.should have_css    ".product h2", :text => product1.name
    page.should have_no_css ".product h2", :text => product2.name
  end

end
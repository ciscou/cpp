require 'acceptance/acceptance_helper'

feature 'Search products', %q{
  In order to filter products by name
  As an user
  I want to use the simple search form
} do

  scenario 'with two products, one of them matches search criteria' do
    product1 = Factory :product
    product2 = Factory :product

    visit homepage

    click_link product1.category.name

    page.should have_css    ".product h2", :text => product1.name
    page.should have_no_css ".product h2", :text => product2.name
  end

end

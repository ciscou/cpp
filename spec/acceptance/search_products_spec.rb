require 'acceptance/acceptance_helper'

feature 'Search products', %q{
  In order to show only the products with a given name
  As an user
  I want to use the simple search form
} do

  background do
    @product1 = Factory :product, :name => "an awesome product"
    @product2 = Factory :product, :name => "another cool product"
    @product3 = Factory :product, :name => "a new awesome product", :new_arrival => true
  end

  scenario 'as an annonymous user' do
    visit homepage

    fill_in "q", :with => "awesome product"
    click_button "Buscar"

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_no_css ".product div.image-title", :text => @product3.name
  end

  scenario 'as a regular user' do
    user = Factory :user, :premium => false
    login_as user

    fill_in "q", :with => "awesome product"
    click_button "Buscar"

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_no_css ".product div.image-title", :text => @product3.name
  end

  scenario 'as a premium user' do
    user = Factory :user, :premium => true
    login_as user

    fill_in "q", :with => "awesome product"
    click_button "Buscar"

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_css    ".product div.image-title", :text => @product3.name
  end

end

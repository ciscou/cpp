require 'acceptance/acceptance_helper'

feature 'List products by category', %q{
  In order to show only the products in a given category
  As an user
  I want to select a category in the menu
} do

  background do
    @product1 = Factory :product
    @product2 = Factory :product
    @product3 = Factory :product, :category => @product1.category, :new_arrival => true
  end

  scenario 'as an annonymous user' do
    visit homepage

    click_link @product1.category.name

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_no_css ".product div.image-title", :text => @product3.name
  end

  scenario 'as a regular user' do
    user = Factory :user, :premium => false
    login_as user

    click_link @product1.category.name

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_no_css ".product div.image-title", :text => @product3.name
  end

  scenario 'as a premium user' do
    user = Factory :user, :premium => true
    login_as user

    click_link @product1.category.name

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_css    ".product div.image-title", :text => @product3.name
  end

end

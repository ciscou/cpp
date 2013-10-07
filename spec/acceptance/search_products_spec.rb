require 'acceptance/acceptance_helper'

feature 'Search products', %q{
  In order to show only the products with a given name
  As an user
  I want to use the simple search form
} do

  background do
    @product1 = FactoryGirl.create :product, :name => "an awesome product"
    @product2 = FactoryGirl.create :product, :name => "another cool product"
    @product3 = FactoryGirl.create :product, :name => "a new awesome product", :new_arrival => true
  end

  scenario 'should find products whose name matches search terms' do
    visit homepage

    fill_in "q", :with => "awesome product"
    click_button "Buscador"

    page.should have_css    ".product div.image-title", :text => @product1.name
    page.should have_no_css ".product div.image-title", :text => @product2.name
    page.should have_css    ".product div.image-title", :text => @product3.name
  end

end

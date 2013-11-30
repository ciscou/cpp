require 'acceptance/acceptance_helper'

feature 'List products by category', %q{
  In order to show only the products in a given category
  As an user
  I want to select a category in the menu
} do

  background do
    @product1 = FactoryGirl.create :product
    @product2 = FactoryGirl.create :product
    @product3 = FactoryGirl.create :product, category: @product1.category, new_arrival: true
  end

  scenario 'should see the products of the selected category (from desktop)' do
    visit homepage

    within "#product_#{@product1.id}" do
      click_link @product1.category.name
    end

    page.should have_css    ".product div.image-title", text: @product1.name
    page.should have_no_css ".product div.image-title", text: @product2.name
    page.should have_css    ".product div.image-title", text: @product3.name
  end

  scenario 'should see the products of the selected category (from mobile)' do
    visit homepage(mobile: 1)

    within "#product_#{@product1.id} .picture" do
      click_link @product1.name
    end

    page.should have_css    "#product_#{@product1.id}"
    page.should have_no_css "#product_#{@product2.id}"
    page.should have_css    "#product_#{@product3.id}"
  end

end

# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'List products by category', %q{
  In order to show only the products in a given category
  As an user
  I want to select a category in the menu
} do

  background do
    @product1 = Factory :product, :new_arrival => true
    @product2 = Factory :product, :new_arrival => true
    @product3 = Factory :product, :new_arrival => true
  end

  scenario 'as an annonymous user' do
    visit homepage

    click_link "Últimas novedades"
    page.current_url.should == pages_new_arrivals_url

    click_link "Catálogo"
    within("#new_arrivals") { click_link "Últimas novedades" }
    page.current_url.should == pages_new_arrivals_url
  end

  scenario 'as a regular user' do
    user = Factory :user, :premium => false
    login_as user

    click_link "Últimas novedades"
    page.current_url.should == pages_new_arrivals_url

    click_link "Catálogo"
    within("#new_arrivals") { click_link "Últimas novedades" }
    page.current_url.should == pages_new_arrivals_url
  end

  scenario 'as a premium user' do
    user = Factory :user, :premium => true
    login_as user

    click_link "Últimas novedades"
    page.current_url.should == new_arrivals_products_url
    page.should have_css ".product div.image-title", :text => @product1.name
    page.should have_css ".product div.image-title", :text => @product2.name
    page.should have_css ".product div.image-title", :text => @product3.name

    click_link "Catálogo"
    within("#new_arrivals") { click_link "Últimas novedades" }
    page.current_url.should == new_arrivals_products_url
    page.should have_css ".product div.image-title", :text => @product1.name
    page.should have_css ".product div.image-title", :text => @product2.name
    page.should have_css ".product div.image-title", :text => @product3.name
  end

end

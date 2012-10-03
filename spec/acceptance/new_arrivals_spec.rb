# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'List products by category', %q{
  In order to stay tuned with the new arrivals
  As an user
  I want to view the last additions to the web
} do

  background do
    @product1 = FactoryGirl.create :product, :new_arrival => true
    @product2 = FactoryGirl.create :product, :new_arrival => true
    @product3 = FactoryGirl.create :product, :new_arrival => true
  end

  scenario 'as an annonymous user' do
    visit homepage

    click_link "Últimas novedades (3)"
    page.current_url.should == pages_new_arrivals_url(locale: :es)

    click_link "Catálogo"
    page.should have_no_css "#new_arrivals"
  end

  scenario 'as a regular user' do
    user = FactoryGirl.create :user, :premium => false
    login_as user

    click_link "Últimas novedades (3)"
    page.current_url.should == pages_new_arrivals_url(locale: :es)

    click_link "Catálogo"
    page.should have_no_css "#new_arrivals"
  end

  scenario 'as a premium user' do
    user = FactoryGirl.create :user, :premium => true
    login_as user

    click_link "Últimas novedades (3)"
    page.current_url.should == new_arrivals_products_url(locale: :es)
    page.should have_css ".product div.image-title", :text => @product1.name
    page.should have_css ".product div.image-title", :text => @product2.name
    page.should have_css ".product div.image-title", :text => @product3.name

    click_link "Catálogo"
    within("#new_arrivals") { click_link "Últimas novedades" }
    page.current_url.should == new_arrivals_products_url(locale: :es)
    page.should have_css ".product div.image-title", :text => @product1.name
    page.should have_css ".product div.image-title", :text => @product2.name
    page.should have_css ".product div.image-title", :text => @product3.name
  end

end

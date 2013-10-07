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

  scenario 'should see the new arrivals section' do
    user = FactoryGirl.create :user
    login_as user

    click_link "Últimas novedades (3)"
    page.current_url.should == new_arrivals_products_url(locale: :es)
    page.should have_css ".product div.image-title", :text => @product1.name
    page.should have_css ".product div.image-title", :text => @product2.name
    page.should have_css ".product div.image-title", :text => @product3.name

    within("#menu") { click_link "Catálogo" }
    within("#new_arrivals") { click_link "Últimas novedades" }
    page.current_url.should == new_arrivals_products_url(locale: :es)
    page.should have_css ".product div.image-title", :text => @product1.name
    page.should have_css ".product div.image-title", :text => @product2.name
    page.should have_css ".product div.image-title", :text => @product3.name
  end

end

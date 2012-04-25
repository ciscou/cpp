# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'List categories', %q{
  In order to view a list of available categories
  As an user
  I want to click the catalog link
} do

  background do
    @category1 = FactoryGirl.create :category
    @category2 = FactoryGirl.create :category
                 FactoryGirl.create :product, :category => @category1, :new_arrival => true
  end

  scenario 'as regular user, should see the two categories and th new arrivals section' do
    visit homepage
    click_link "Catálogo"

    page.should have_css "#new_arrivals h2", :text => "Últimas novedades"
    page.should have_css ".category h2"    , :text => @category1.name
    page.should have_css ".category h2"    , :text => @category2.name
  end

  scenario 'as premium user, should see the two categories and the new arrivals section' do
    user = FactoryGirl.create :user, :premium => true
    login_as user
    click_link "Catálogo"

    page.should have_css "#new_arrivals h2", :text => "Últimas novedades"
    page.should have_css ".category h2"    , :text => @category1.name
    page.should have_css ".category h2"    , :text => @category2.name
  end

end

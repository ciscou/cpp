# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'List categories', %q{
  In order to view a list of available categories
  As an user
  I want to click the catalog link
} do

  scenario 'with two categories' do
    category1 = Factory :category
    category2 = Factory :category

    visit homepage

    click_link "Catálogo"

    page.should have_css ".category h2", :text => category1.name
    page.should have_css ".category h2", :text => category2.name
  end

end

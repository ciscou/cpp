# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'Create category', %q{
  In order to keep products classified
  As an admin
  I want to create categories first
} do

  context "as guest" do
    background do
      visit homepage
    end

    scenario "should not see link" do
      click_link "Catálogo"
      page.should have_no_link "Añadir otra categoría"
    end

    scenario "should not be able to see the form" do
      visit new_category_url
      current_url.should == root_url(locale: :es)
    end
  end

  context "as regular user" do
    background do
      user = FactoryGirl.create :user, :admin => false
      login_as user
    end

    scenario "should not see link" do
      click_link "Catálogo"
      page.should have_no_link "Añadir otra categoría"
    end

    scenario "should not be able to see the form" do
      visit new_category_url
      current_url.should == root_url(locale: :es)
    end
  end

  context "as admin" do
    background do
      admin = FactoryGirl.create :user, :admin => true
      login_as admin
    end

    scenario 'with valid attributes' do
      within("#menu") { click_link "Catálogo" }

      page.should have_no_css ".category"

      click_link "Añadir otra categoría"

      fill_in "Nombre", :with => "Now this is an awesome category!"
      fill_in "Descripción", :with => "This category will be soon full of awesome products.\n\nJust come back in a few minutes"
      attach_file "Foto", Rails.root.join("spec", "acceptance", "data", "example_picture.jpg")
      click_button "Guardar"

      within("#menu") { click_link "Catálogo" }

      within ".category" do
        page.should have_css "h2", :text => "Now this is an awesome category!"
        page.should have_content "This category will be soon full of awesome products."
        page.should have_content "Just come back in a few minutes"
        page.should have_image "small_now-this-is-an-awesome-category.jpg"
      end
    end
  end

end

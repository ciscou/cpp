# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'Create category', %q{
  In order to keep products classified
  As an admin
  I want to create categories first
} do

  scenario 'with two categories' do
    admin = Factory :user, :admin => true
    login_as admin

    click_link "Catálogo"

    page.should have_no_css ".category"

    click_link "Añadir otra categoría"

    fill_in "Nombre", :with => "Now this is an awesome category!"
    fill_in "Descripción", :with => "This category will be soon full of awesome products.\n\nJust come back in a few minutes"
    attach_file "Foto", Rails.root.join("spec", "acceptance", "data", "example_picture.jpg")
    click_button "Guardar"

    within ".category" do
      page.should have_css "h2", :text => "Now this is an awesome category!"
      page.should have_content "This category will be soon full of awesome products."
      page.should have_content "Just come back in a few minutes"
      page.should have_image "now-this-is-an-awesome-category.jpg"
    end

    click_link "Catálogo"

    within ".category" do
      page.should have_css "h2", :text => "Now this is an awesome category!"
      page.should have_content "This category will be soon full of awesome products."
      page.should have_content "Just come back in a few minutes"
      page.should have_image "thumb_now-this-is-an-awesome-category.jpg"
    end
  end

end

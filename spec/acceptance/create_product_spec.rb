# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'Create product', %q{
  In order to have another product to show to the world
  As an admin
  I want to create a product in a category
} do

  scenario 'with valid attributes' do
    admin    = Factory :user, :admin => true
    category = Factory :category

    login_as admin

    click_link category.name

    page.should have_no_css ".product"

    click_link "Añadir otro producto a esta categoría"

    fill_in "Nombre", :with => "Now this is an awesome product!"
    fill_in "Descripción", :with => "This is the most awesome product yet in this category.\n\nNot only because this is the only one"
    attach_file "Foto", Rails.root.join("spec", "acceptance", "data", "example_picture.jpg")
    click_button "Guardar"

    within ".product" do
      page.should have_css "h2", :text => "Now this is an awesome product!"
      page.should have_content "This is the most awesome product yet in this category."
      page.should have_content "Not only because this is the only one"
      page.should have_image "now-this-is-an-awesome-product.jpg"
    end

    click_link category.name

    within ".product" do
      page.should have_css "h2", :text => "Now this is an awesome product!"
      page.should have_content "This is the most awesome product yet in this category."
      page.should have_content "Not only because this is the only one"
      page.should have_image "thumb_now-this-is-an-awesome-product.jpg"
    end
  end

end

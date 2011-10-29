# encoding: utf-8

require 'acceptance/acceptance_helper'

feature 'Create product', %q{
  In order to have another product to show to the world
  As an admin
  I want to create a product in a category
} do

  background do
    @category = Factory :category
  end

  context "as guest" do
    background do
      visit homepage
    end

    scenario "should not see link" do
      click_link @category.name
      page.should have_no_link "Añadir otro producto a esta categoría"
    end

    scenario "should not be able to see the form" do
      visit new_category_product_url(@category)
      current_url.should == root_url
    end
  end

  context "as regular user" do
    background do
      user = Factory :user, :admin => false
      login_as user
    end

    scenario "should not see link" do
      click_link @category.name
      page.should have_no_link "Añadir otro producto a esta categoría"
    end

    scenario "should not be able to see the form" do
      visit new_category_product_url(@category)
      current_url.should == root_url
    end
  end

  context "as admin" do
    background do
      admin = Factory :user, :admin => true
      login_as admin
    end

    scenario 'with valid attributes' do
      click_link @category.name

      page.should have_no_css ".product"

      click_link "Añadir otro producto a esta categoría"

      fill_in "Nombre", :with => "Now this is an awesome product!"
      fill_in "Descripción", :with => "This is the most awesome product yet in this category.\n\nNot only because this is the only one"
      attach_file "Foto", Rails.root.join("spec", "acceptance", "data", "example_picture.jpg")
      click_button "Guardar"

      within "#thumbs" do
        page.should have_css "div.image-title", :text => "Now this is an awesome product!"
        page.should have_content "This is the most awesome product yet in this category."
        page.should have_content "Not only because this is the only one"
        page.should have_image "thumb_now-this-is-an-awesome-product.jpg"
      end
    end
  end

end

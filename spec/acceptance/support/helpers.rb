module HelperMethods
  def login_as(user)
    visit new_user_session_path
    fill_in "Email"     , :with => user.email
    fill_in "Contraseña", :with => "s3cr3t"
    click_button "Iniciar sesión"
  end
end

module Capybara
  class Session
    def has_image?(src)
      has_xpath?("//img[contains(@src,\"/#{src}\")]")
    end
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance

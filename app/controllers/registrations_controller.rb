class RegistrationsController < Devise::RegistrationsController
  before_action :check_for_mobile, only: [:new, :create]
end

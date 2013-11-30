class SessionsController < Devise::SessionsController
  before_action :check_for_mobile, only: [:new, :create]
end

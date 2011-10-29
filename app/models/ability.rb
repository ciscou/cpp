class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # for guest

    if user.admin?
      can :access, :all
    else
      can :access, :pages
      can :read, :categories
      if user.premium?
        can [:read, :search], :products
      else
        can [:read, :search], :products, :new_arrival => false
      end
    end
  end
end
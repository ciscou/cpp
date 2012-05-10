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
        can [:read, :search, :new_arrivals], :products
      else
        can [:read, :search               ], :products, :new_arrival => false
      end
    end

    can :new, :contacts
    if user.persisted?
      can :create, :contacts
    end

    can :read, :sitemaps
  end
end

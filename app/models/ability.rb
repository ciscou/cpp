class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # for guest

    if user.admin?
      can :access, :all
    else
      can :access, :pages
      can :read, :categories
      can [:read, :search, :new_arrivals], :products
    end

    can :new, :contacts
    if user.persisted?
      can :create, :contacts
    end

    can :read, :sitemaps
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user != nil
      can [:update, :destroy], User, id: user.id
      if user.owner?
        can :manage, :all
      elsif user.admin?
        can :read, Publishable
        can :create, Publishable
        can :update, Publishable
        can :read, PublishableGroup
        can :create, PublishableGroup
        can :update, PublishableGroup
        can :read, Site
        can :create, Site
        can :update, Site
        can :read, User
        can :create, User
        can :update, User
      elsif user.editor?
        can :read, :all
        can :manage, Publishable
      end
    end
  end

end

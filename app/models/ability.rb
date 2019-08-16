class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user != nil
      can [:update, :destroy], User, id: user.id
      if user.owner?
        can :manage, :all
      elsif user.admin?
        can :read, Page
        can :create, Page
        can :update, Page
        can :read, User
        can :create, User
        can :update, User
      elsif user.editor?
        can :read, :all
        can :manage, Page
      end
    end
  end

end

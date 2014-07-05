class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.persisted?
      can :manage, Notebook, user_id: user.id
      can :manage, User
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.email?
      can :manage, :all
    else
      cannot :manage, :all
    end
  end
end

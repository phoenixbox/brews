class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new

    if user
      can :manage, Game do |game| 
        game.try(:user) == user
      end
    else
      can :read, :all
    end
  end
end
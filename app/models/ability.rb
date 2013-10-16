class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Todo, user_id: user.id
    can :manage, Tag, user_id: user.id
    can :manage, Project, user_id: user.id
  end
end

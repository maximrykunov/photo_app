class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Photo
    can :manage, Photo, user_id: user.id
  end
end
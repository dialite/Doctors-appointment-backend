# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Appointment, author: user
      can :read, :all
    end
  end
end

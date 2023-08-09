# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :update, User, id: user.id  # 自分自身の情報のみ編集可能
    end
  end
end

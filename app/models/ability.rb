# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    @user = user || User.new
   
    if user.admin?
      can :manage, :all
      can :destroy, User  # 管理者はユーザーを削除できる
    else
      can :read, :all
      can :update, User, id: user.id  # 自分自身の情報のみ編集可能
    end
  end
end

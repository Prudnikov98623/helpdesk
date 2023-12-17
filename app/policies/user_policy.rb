class UserPolicy < ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin? # Разрешено только администраторам
  end

  def show?
    user.admin? || user.engineer? # Разрешено администраторам и инженерам
  end


end

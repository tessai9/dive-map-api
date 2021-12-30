# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin? || (common? && record.id == user.id)
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    admin? || record.id == user.id
  end

  def destroy?
    admin? || (common? && record.id == user.id)
  end

  def permitted_attributes
    if admin?
      %i[name password role email birthday]
    else
      %i[name password email birthday]
    end
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where.not(role: :admin)
      end
    end
  end
end

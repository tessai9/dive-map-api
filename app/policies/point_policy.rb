# frozen_string_literal: true

class PointPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    admin? || official?
  end

  def update?
    admin? || official?
  end

  def destroy?
    admin? || official?
  end

  def permitted_attributes
    %i[name point_map region_id]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

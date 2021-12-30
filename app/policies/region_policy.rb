class RegionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    admin? || official?
  end

  def edit?
    update?
  end

  def update?
    admin? || official?
  end

  def destroy?
    admin? || official?
  end

  def permitted_attributes
    [:name, :prefecture_id]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

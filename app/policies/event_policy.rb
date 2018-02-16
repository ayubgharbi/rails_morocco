class EventPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.admin?
  end
 
  def update?
    user.present? && user == event.user
  end
 
  def destroy?
    user.present? && user == event.user
  end
 
  private
 
    def event
      record
    end
end
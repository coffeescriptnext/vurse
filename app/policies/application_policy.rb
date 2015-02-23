# Default admin-only authorization policy.
class ApplicationPolicy
  attr_accessor :user, :resource

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  def create?
    admin?
  end
  alias_method :new?, :create?

  def destroy?
    admin?
  end

  def show?
    admin?
  end
  alias_method :index?, :show?

  def update?
    admin?
  end
  alias_method :edit?, :update?

  protected

  delegate :admin?, to: :user, allow_nil: true
end

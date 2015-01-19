# Default admin-only authorization policy.
class ApplicationPolicy < Struct.new(:user, :resource)
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

class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # @conversation = policy_scope(Conversation).find(params[:id])
    true
  end

  def edit?
    user == record
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

end

class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where("articles.count_of_reports < ?", 3 )
    end
  end

  def show?
    true
  end

  def edit?
    user == record.user || user.is_admin?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

end

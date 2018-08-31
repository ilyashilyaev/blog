class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope, :parent

    def initialize(user, scope, parent = nil)
      @user = user
      @scope = scope
      @parent = parent
      puts '########'
      puts '########'
      puts @user.inspect
      puts '########'
      puts '########'
      puts @scope.inspect
      puts '########'
      puts @parent.inspect
      puts '########'
    end

    def resolve
      scope.all
    end
  end
end

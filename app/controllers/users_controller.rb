class UsersController < ApplicationController

  def index
    @users = policy_scope(User)

    if params[:q].present?
      @users = @users.where("CONCAT(first_name,' ',last_name) ILIKE :q OR nickname ILIKE :q ", q: "%#{params[:q]}%")
    end

    @users = @users.page(params[:page])

  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def my_favorites
    @my_favorite_articles = current_user.my_favorite_articles
    render layout: false
  end



  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :avatar)

  end

end

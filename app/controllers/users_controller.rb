class UsersController < ApplicationController



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


  private

  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :avatar)

  end

end

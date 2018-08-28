class UsersController < ApplicationController

    def edit
      @user = User.find(params[:id])
    end

  def show
    @user = User.find(params[:id])
  end


    private

    def user_params
      params.require(:user).permit(:nickname, :last_name, :first_name, :email,
                                    :password)
    end

end

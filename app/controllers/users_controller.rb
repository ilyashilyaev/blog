class UsersController < ApplicationController

    def edit
      @user = User.find(params[:id])
      end


    def show
      @user = User.find(params[:id])
    end

    def new

    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:nickname, :last_name, :first_name, :email,
                                    :password)
    end

end

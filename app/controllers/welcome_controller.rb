class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
  end


  def check_nickname
    user = User.find_by(nickname: params[:nickname])
    render json: {is_exist: user.present?}
  end

  def game
  end

end
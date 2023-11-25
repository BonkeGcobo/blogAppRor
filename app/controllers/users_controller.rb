class UsersController < ApplicationController
  def index
    @users=User.all 
  end

  def show
    @param = params[:id]
    @user=User.find(@param)
    @posts=@user.recent_post
  end
end

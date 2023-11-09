class UsersController < ApplicationController
  def index
    @users=User.all 
  end

  def show
    @param = params[:id]
  end
end

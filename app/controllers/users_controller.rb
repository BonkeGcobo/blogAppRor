class UsersController < ApplicationController
  def index; end

  def show
    @param = params[:id]
  end
end

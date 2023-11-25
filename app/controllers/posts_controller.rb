class PostsController < ApplicationController
  def index
    @userID = params[:user_id]
    @user = User.find(@userID)
    @user_posts= @user.recent_post
    
  end

  def show
    @post = Post.find(params[:id])
  end
end

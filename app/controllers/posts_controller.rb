class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(authorId: params[:user_id])
    @users = User.all.order(id: :asc)
  end

  def show; end
end

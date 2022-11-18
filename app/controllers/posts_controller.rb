class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(authorId: params[:user_id])
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @users = User.all.order(id: :asc)
  end
end

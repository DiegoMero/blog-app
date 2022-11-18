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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user

    if @post.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
end

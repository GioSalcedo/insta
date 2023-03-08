class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(@post.user_id, @post.id)
    else
      render :edit
    end
  end

  def destoy
    @post.destroy
    redirect_to user_post_path(@post.user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end
end

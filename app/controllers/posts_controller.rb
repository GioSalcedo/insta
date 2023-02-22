class CommentController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @comment = Comment.where(post_id: params[:post_id])
  end

  def show;end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_comment_path(@comment.post_id, @comment.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_comment_path(@comment.post_id, @comment.id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_comment_path(@comment.post_id)
  end

  private 

  def set_post
    @comment = Comment.find(params[:id])
  end

  def post_params
    params.require(:comment).permit(:content)
  end
end
class CommentsController < ApplicationController
  include CableReady::Broadcaster
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comment = Comment.where(post_id: params[:post_id])
  end

  def show;end

  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      cable_ready["timeline"].insert_adjacent_html(
        selector: "#timeline",
        position: "beforeend",
        html: render_to_string(partial: "comments/comment", locals: { comment: @comment })
      )
      cable_ready.broadcast
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

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
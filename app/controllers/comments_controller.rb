class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comment = Comment.where(post_id: params[:post_id])
  end

  def show;end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
  
    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { turbo_stream.append 'comments_list', partial: 'comments/comment', locals: { comment: @comment } }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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
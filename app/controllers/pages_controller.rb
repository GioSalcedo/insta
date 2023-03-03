class PagesController < ApplicationController
  def home
    @posts = Post.all
    @comment = Comment.new
  end
end

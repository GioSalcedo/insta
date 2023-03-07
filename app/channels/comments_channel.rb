class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_#{params[:post_id]}"
  end
end

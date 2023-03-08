class CommentsReflex < ApplicationReflex
  def submit
    text = params["text"].to_s
    post = Post.find(params["pts"]["pts_id"].to_i)
    # profile = User.find(params["user"]["user_id"].to_i)
	p "text: #{text}"
    unless text.blank?
      Comment.create(content: text, post: post, user: User.find(1))
    end
  end

  def delete
    Comment.find(element.dataset[:step].to_i).destroy
  end
end
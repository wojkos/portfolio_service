class PostsChannel < ApplicationCable::Channel
  def subsribed
    stream_from "posts_#{params['post_id']}_channel"
  end
  
  def unsubsribed
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], post_id: data['post_id'])
  end
end

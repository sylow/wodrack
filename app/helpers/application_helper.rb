module ApplicationHelper
  # I prefer to use draper to decorate but you said no gem
  def like_or_unlike_link(current_user, post)
    label = current_user.likes.where(post: post).any? ? 'Unlike' : 'Like'
    
    link_to label, toggle_post_likes_path(post), method: :post, remote: true, class: 'like-post'
  end
end

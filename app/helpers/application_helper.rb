module ApplicationHelper
  # I prefer to use draper to decorate but you said no gem
  def like_or_unlike_link(post)
    label = post.likes.any?{ |like| like.user_id == current_user.id } ? 'Unlike' : 'Like'
    link_to label, toggle_post_likes_path(post), method: :post, remote: true, class: 'like-post'
  end
end

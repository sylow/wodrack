class Posts::LikesController < ApplicationController
  
  # Create a like if no record found
  # Destroy the like if it was liked before
  def toggle
    like = current_user.likes.find_or_initialize_by( post: post )
            
    if like.persisted? # unlike if it is in our liked posts
      like.destroy    
      render json: { result: :destroyed, like: like, count: post.reload.likes_count }
    else               # like if it is not in our liked posts
      like.save     
      render json: { result: :created, like: like, count: post.reload.likes_count }
    end
  end

  private
  def post
    @post ||= Post.find( params[:post_id] )
  end
  
end

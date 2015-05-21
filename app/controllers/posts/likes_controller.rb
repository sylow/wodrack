class Posts::LikesController < ApplicationController
  
  # Create a like if no record found
  # Destroy the like if it was liked before
  def toggle
    like = current_user.likes.first_or_initialize( post: post )
            
    if like.persisted? # unlike if it is in our liked posts
      like.destroy    
      render json: { result: :destroyed, like: like, count: post.likes.count }
    else               # like if it is not in our liked posts
      like.save     
      render json: { result: :created, like: like, count: post.likes.count }
    end
  end

  private
  def post
    @post ||= Post.find( params[:post_id] )
  end
end

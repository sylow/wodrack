class User < ActiveRecord::Base
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
end

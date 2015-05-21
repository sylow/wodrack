class User < ActiveRecord::Base
  has_many :likes, dependent: :delete_all
  has_many :liked_posts, through: :likes, source: :post
end

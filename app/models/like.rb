class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, counter_cache: true
  
  validates :user, uniqueness: {scope: :post}
end

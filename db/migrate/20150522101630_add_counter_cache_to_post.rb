class AddCounterCacheToPost < ActiveRecord::Migration
  def change
    add_column :posts, :likes_count, :integer, default: 0, null: false
  end
end

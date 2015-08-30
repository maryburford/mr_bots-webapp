class AddPostIdToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :post_id, :integer
  end
end

class ChangePostIdToEngagements < ActiveRecord::Migration
  def change
  	change_column :engagements, :post_id,  :bigint
  end
end

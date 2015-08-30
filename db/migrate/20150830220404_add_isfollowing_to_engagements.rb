class AddIsfollowingToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :isfollowing, :boolean, :default => false
  end
end

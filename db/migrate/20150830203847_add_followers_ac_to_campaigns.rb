class AddFollowersAcToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :followers_acquired, :integer
  end
end

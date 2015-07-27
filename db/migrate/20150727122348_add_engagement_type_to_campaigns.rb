class AddEngagementTypeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :engagement_type, :string
  end
end

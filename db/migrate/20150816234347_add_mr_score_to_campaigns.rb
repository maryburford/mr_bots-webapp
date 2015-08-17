class AddMrScoreToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :mr_score, :decimal
  end
end

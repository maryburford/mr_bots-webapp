class AddEngagementsPerDayToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :engagements_per_day, :integer
  end
end

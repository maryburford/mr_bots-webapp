class AddAccountIdToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :account_id, :integer
  end
end

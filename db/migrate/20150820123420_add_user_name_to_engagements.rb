class AddUserNameToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :user_name, :string
  end
end

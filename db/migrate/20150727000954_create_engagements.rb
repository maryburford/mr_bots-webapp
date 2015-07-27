class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.integer :campaign_id
      t.integer :prey_id

      t.timestamps null: false
    end
  end
end

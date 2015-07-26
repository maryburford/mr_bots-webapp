class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :account_id
      t.string :target
      t.integer :max_favs
      t.boolean :active

      t.timestamps null: false
    end
  end
end

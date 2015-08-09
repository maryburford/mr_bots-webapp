class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.bigint :account_id
      t.bigint :follower_id
      t.string :provider

      t.timestamps null: false
    end
  end
end

class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :provider
      t.string :provider_id
      t.string :name
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end
end

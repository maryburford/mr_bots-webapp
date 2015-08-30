class AddColumnsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :nickname, :string
    add_column :accounts, :image, :string
    add_column :accounts, :email, :string
  end
end

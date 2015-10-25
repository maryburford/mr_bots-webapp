class AddAccountCreationDateToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :account_creation_date, :datetime
  end
end

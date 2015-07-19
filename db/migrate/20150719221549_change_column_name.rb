class ChangeColumnName < ActiveRecord::Migration
  def change
  rename_column :accounts, :provider_id, :uid
  end
end

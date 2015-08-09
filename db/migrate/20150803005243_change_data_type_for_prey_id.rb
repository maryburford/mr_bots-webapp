class ChangeDataTypeForPreyId < ActiveRecord::Migration
  def change
  	change_column :engagements, :prey_id,  :bigint
  end
end

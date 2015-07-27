class FuckUpSomeColumns < ActiveRecord::Migration
  def change
  rename_column :campaigns, :max_favs, :engagements_per_prey
  end
end

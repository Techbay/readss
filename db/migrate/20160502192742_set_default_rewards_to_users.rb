class SetDefaultRewardsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :reward, :int, :default => 0
  end
end

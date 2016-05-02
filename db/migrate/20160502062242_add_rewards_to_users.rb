class AddRewardsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reward, :integer
  end
end

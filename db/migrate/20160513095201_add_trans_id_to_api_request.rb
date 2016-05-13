class AddTransIdToApiRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :api_requests, :trans_id, :string
  end
end

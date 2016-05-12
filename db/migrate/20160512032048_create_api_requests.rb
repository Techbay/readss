class CreateApiRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :api_requests do |t|
      t.string :address
      t.string :from

      t.timestamps
    end
  end
end

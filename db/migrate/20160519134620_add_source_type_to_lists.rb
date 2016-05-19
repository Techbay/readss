class AddSourceTypeToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :source_type, :integer
  end
end

class AddIsProToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :is_pro, :boolean, default: false
  end
end

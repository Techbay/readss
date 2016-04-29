class AddIdAndTypeToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :video_id, :string
    add_column :videos, :video_type, :string
  end
end

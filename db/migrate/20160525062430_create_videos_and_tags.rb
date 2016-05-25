class CreateVideosAndTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_videos, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :video, index: true
    end
  end
end

class CreateUsersAndVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :users_videos, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :video, index: true
    end
  end
end

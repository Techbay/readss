class AlterEntryTableToVideos < ActiveRecord::Migration[5.0]
  def change
    rename_table('entries', 'videos')
  end
end

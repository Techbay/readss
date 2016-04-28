class AddColumnsToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :published_at, :date
    add_column :videos, :thumbnail_url, :string
    add_column :videos, :channel_id, :string
    add_column :videos, :channel_title, :string
    add_column :videos, :category_id, :integer
    add_column :videos, :category_title, :string
    add_column :videos, :view_count, :integer
    add_column :videos, :like_count, :integer
    add_column :videos, :dislike_count, :integer
    add_column :videos, :favorite_count, :integer
    add_column :videos, :comment_count, :integer
    add_column :videos, :duration, :integer
    add_column :videos, :is_hd, :boolean
    add_column :videos, :embed_html, :string
  end
end

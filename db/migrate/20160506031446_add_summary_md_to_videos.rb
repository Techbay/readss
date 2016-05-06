class AddSummaryMdToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :summary_md, :string
  end
end

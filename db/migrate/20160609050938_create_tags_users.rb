class CreateTagsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true
    end
  end
end

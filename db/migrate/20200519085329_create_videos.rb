class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string  :movie
      t.string  :title
      t.string  :explain
      t.integer  :genre_id
      t.integer  :tag_id
      t.timestamps
    end
  end
end

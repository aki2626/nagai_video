class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string  :movie
      t.string  :title
      t.string  :explain
      t.string  :genre
      t.string  :tag
      t.timestamps
    end
  end
end

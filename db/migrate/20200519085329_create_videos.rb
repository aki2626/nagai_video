class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string  :movie
      t.string  :explain
      t.timestamps
    end
  end
end

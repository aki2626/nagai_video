class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string  :video
      t.string  :explain
      #  仮です。
      t.timestamps
    end
  end
end

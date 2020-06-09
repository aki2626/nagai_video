class CreateVideoMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :video_mylists do |t|
      t.references :mylist, foreign_key: true
      t.references :video,  foreign_key: true
      t.timestamps
    end
  end
end

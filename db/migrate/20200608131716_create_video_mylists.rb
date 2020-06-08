class CreateVideoMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :video_mylists do |t|

      t.timestamps
    end
  end
end

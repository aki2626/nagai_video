class CreateMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :mylists do |t|
      t.references :user, null:false
      t.references :video, null:false
      t.timestamps
    end
  end
end

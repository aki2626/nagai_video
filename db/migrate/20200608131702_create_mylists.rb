class CreateMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :mylists do |t|
      t.references :user, null:false, foreign_key: true
      t.string :name,     null: false
      t.string :explain,  null: false
      t.timestamps
    end
  end
end

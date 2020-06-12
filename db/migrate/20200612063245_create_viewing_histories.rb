class CreateViewingHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_histories do |t|
      t.references :user, foreign_key: true
      t.references :video,  foreign_key: true
      t.timestamps
    end
  end
end

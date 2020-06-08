class CreateMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :mylists do |t|

      t.timestamps
    end
  end
end

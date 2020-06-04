class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|

      t.timestamps
    end
  end
end

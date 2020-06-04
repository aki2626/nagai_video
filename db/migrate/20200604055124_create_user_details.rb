class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.integer       :gender
      t.integer       :prefecture_id
      t.references    :user
      t.date          :birth_date, null: false, use_month_numbers: true
      t.timestamps
    end
  end
end

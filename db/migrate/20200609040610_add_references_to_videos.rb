class AddReferencesToVideos < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :user, null: false, foreign_key: true
  end
end

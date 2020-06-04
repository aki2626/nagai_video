class UserDetail < ApplicationRecord
  belongs_to :user, optional: true
  validates :gender, :prefecture_id, :birth_date, presence: true
end

class UserDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user, optional: true
  validates :gender, :prefecture_id, :birth_date, presence: true
end

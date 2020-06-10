class Mylist < ApplicationRecord
  belongs_to :user
  has_many   :video_mylists, foreign_key: 'mylist_id'
  has_many   :videos, through: :video_mylists
  validates  :name, presence: true, uniqueness: true
end

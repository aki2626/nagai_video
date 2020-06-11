class Mylist < ApplicationRecord
  belongs_to :user
  has_many   :video_mylists
  has_many   :videos, through: :video_mylists
  validates  :name, presence: true
end

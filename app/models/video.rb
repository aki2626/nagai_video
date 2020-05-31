class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader
  validates :movie,             presence: true
  validates :title,             presence: true
  validates :explain,           presence: true
  validates :genre_id,          presence: true
  validates :tag_id,            presence: true

  belongs_to_active_hash :tag
  belongs_to_active_hash :genre
end

class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader
  validates :movie,             presence: true
  validates :title,             presence: true
  validates :explain,           presence: true
  validates :genre,             presence: true
  validates :tag,               presence: true
end

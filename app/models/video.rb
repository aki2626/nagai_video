class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader
  validates :movie,           presence: true
end

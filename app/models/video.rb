class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader
end

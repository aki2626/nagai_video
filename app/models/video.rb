class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader
  validates :movie,             presence: true
  validates :title,             presence: true
  validates :explain,           presence: true
  validates :genre_id,          presence: true
  # validates :tag_list,           presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  acts_as_taggable_on :tags  
end

class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader

  has_many  :video_mylists, foreign_key: 'video_id'
  has_many  :mylists, through: :video_mylists
  belongs_to  :user
  validates :movie,             presence: true
  validates :title,             presence: true
  validates :explain,           presence: true
  validates :genre_id,          presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  acts_as_taggable_on :tags  
  is_impressionable
end

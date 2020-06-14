class Video < ApplicationRecord
  mount_uploader :movie, MovieUploader

  has_many  :video_mylists, foreign_key: 'video_id', dependent: :destroy 
  has_many  :mylists, through: :video_mylists
  has_many  :viewing_histories, dependent: :destroy 

  belongs_to  :user
  validates :movie,             presence: true
  validates :title,             presence: true
  validates :explain,           presence: true
  validates :genre_id,          presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  acts_as_taggable_on :tags  
  is_impressionable

  # 動画検索機能の定義
  scope :search, -> (search){ where('title LIKE ?', "%#{search}%" )}

  scope :ranking, -> { find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(5).pluck(:impressionable_id))}
  scope :history, -> (user){ find(user.viewing_histories.all.order('created_at DESC').pluck(:video_id))}
end

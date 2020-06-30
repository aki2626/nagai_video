class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname, presence: true
  has_one   :user_detail
  has_many  :videos
  has_many  :comments
  has_many  :mylists, dependent: :destroy
  has_many  :viewing_histories, dependent: :destroy 
  has_many :sns_credentials
end

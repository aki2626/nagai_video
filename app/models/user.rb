class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  has_one   :user_detail
  has_many  :videos
  has_many  :comments
  has_many  :mylists, dependent: :destroy
  has_many  :viewing_histories, dependent: :destroy 
end

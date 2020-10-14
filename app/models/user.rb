class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :profile, length: { maximum: 200 }       
  
  has_many :books
  has_many :comments
  has_many :favorites
  has_many :favorite_books, through: :favorites, source: :book
end

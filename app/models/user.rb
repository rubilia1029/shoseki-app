class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers'

  with_options presence: true do
    validates :nickname
    validates :password_confirmation
  end  
  validates :profile, length: { maximum: 200 }       
  
  has_many :books
  has_many :comments
  has_many :favorites
  has_many :favorite_books, through: :favorites, source: :book
end

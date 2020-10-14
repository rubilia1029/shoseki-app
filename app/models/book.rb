class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :favorites

  with_options presence: true do
    validates :image, :name, :author
    validates :category_id, numericality: { other_than: 1, message: 'Select'}
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end

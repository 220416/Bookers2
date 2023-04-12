class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end

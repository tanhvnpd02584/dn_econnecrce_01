class Product < ApplicationRecord
  # 1 product belong_to 1 category
  belongs_to :category

  # 1 product has many rating
  has_many :ratings, dependent: :destroy

  # 1 product has many details purchase
  has_many :detailpurchases, dependent: :destroy

  # active record 1 product 1 image
  has_one_attached :image

  validates :name, length: {maximum: Settings.name_maximum, message: :bad_name},
   presence: true
  validates :unit_price, numericality: {greater_than: Settings.price_greater,
                                        less_than: Settings.price_less}
  validates :quantity, numericality: {greater_than: Settings.price_greater,
                                      less_than: Settings.price_less}
  validates :image, content_type: {in: Settings.file_valid, message: :bad_image}
end

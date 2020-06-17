class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  scope :sorted, ->{order :name}
end

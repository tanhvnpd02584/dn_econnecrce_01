class Detailpurchase < ApplicationRecord
  belongs_to :product
  belongs_to :purchase

  delegate :name, :unit_price, to: :product
end

class Purchase < ApplicationRecord
  has_many :detailpurchases, dependent: :destroy
  belongs_to :user
end

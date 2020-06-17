class Purchase < ApplicationRecord
  # 1 purchases has many detailpurchases
  has_many :detailpurchases, dependent: :destroy

  # 1 puchase belongs to 1 user
  belongs_to :user
end

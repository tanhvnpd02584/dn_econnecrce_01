class Purchase < ApplicationRecord
  # 1 purchases has many detailpurchases
  has_many :detailpurchases, dependent: :destroy

  # 1 puchase belongs to 1 user
  belongs_to :user

  scope :sorted, ->{order :id}

  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/.freeze

  validates :name, length: {maximum: Settings.name_maximum,
                            message: :bad_name},
   presence: true
  validates :phone_number, length: {maximum: Settings.phone_number_maximum,
                                    minimum: Settings.phone_number_minimum,
                                    message: :bad_phone_number},
   format: {with: VALID_PHONE_NUMBER_REGEX,
            message: :bad_phone_number},
   presence: true
  validates :address, length: {maximum: Settings.address_maximum,
                               message: :bad_address},
   presence: true

  def send_mail_to_customer email, session
    OrderMailer.send_order(self, email, session).deliver_now
  end

  class << self
    def group_purchase
      group("DATE(created_at)").count
    end

    def to_xls options = {}
      CSV.generate(options) do |csv|
        csv << column_names
        sorted.each do |purchase|
          csv << purchase.attributes.values_at(*column_names)
        end
      end
    end
  end
end

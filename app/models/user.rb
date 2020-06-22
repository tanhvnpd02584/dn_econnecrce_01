class User < ApplicationRecord
  # association one user has many Ratings
  has_many :ratings, dependent: :destroy

  # association one user has many purchases
  has_many :purchases, dependent: :destroy

  # macro of byscrypt have password and password confirm
  has_secure_password

  # constant regex email vs phone_number
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PHONE_NUMBER_REGEX = /\d[0-9]\)*\z/.freeze

  # validations and macro
  validates :email, length: {maximum: Settings.email_maximum,
                             message: :bad_email},
   format: {with: VALID_EMAIL_REGEX,
            message: :bad_email},
   presence: true,
   uniqueness: true
  validates :password, length: {in:
   Settings.password_from...Settings.password_to}
  validates :name, length: {maximum: Settings.name_maximum,
                            message: :bad_name},
   presence: true
  validates :phone_number, length: {maximum: Settings.phone_number_maximum,
                                    minimum: Settings.phone_number_minimum,
                                    message: :bad_phone_number},
   format: {with: VALID_PHONE_NUMBER_REGEX,
            message: :bad_phone_number}
end

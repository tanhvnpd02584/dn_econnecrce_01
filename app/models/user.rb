class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :purchases, dependent: :destroy

  # macro of byscrypt have password and password confirm
  has_secure_password
end

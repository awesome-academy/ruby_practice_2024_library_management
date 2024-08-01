class User < ApplicationRecord
  has_many :borrow_requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
end

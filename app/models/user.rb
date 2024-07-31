class User < ApplicationRecord
  has_many :borrow_requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password

  validates :email, presence: true, length: {maximum: Settings.digit_255},
                    format: {with: Regexp.new(Settings.VALID_EMAIL_REGEX)},
                     uniqueness: true
  validates :name, presence: true,
    length: {in: 1..50, too_long: "50 characters is the maximum allowed",
             too_short: "1 character is the minimum allowed"}
  validates :password, presence: true, length: {minimum: Settings.digit_6},
                                       allow_nil: true
end

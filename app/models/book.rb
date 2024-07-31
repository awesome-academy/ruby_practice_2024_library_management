class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  has_many :borrow_requests, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :price, presence: true
end

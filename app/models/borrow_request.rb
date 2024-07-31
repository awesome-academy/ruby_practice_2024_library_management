class BorrowRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date, :end_date, :status, :rejection_reason, presence: true
end

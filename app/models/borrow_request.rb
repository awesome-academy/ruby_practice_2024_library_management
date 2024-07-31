class BorrowRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date, :end_date, presence: true

  after_initialize :set_defaults, if: :new_record?

  enum status: { pending: 0, borrowing: 1, payed: 2, canceled: 3 }

  private

  def set_defaults
    self.status ||= :pending
    self.rejection_reason ||= ""
  end
end

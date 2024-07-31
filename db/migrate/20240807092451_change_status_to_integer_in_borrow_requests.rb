class ChangeStatusToIntegerInBorrowRequests < ActiveRecord::Migration[7.0]
  def change
    change_column :borrow_requests, :status, :integer, using: 'status::integer'
  end
end

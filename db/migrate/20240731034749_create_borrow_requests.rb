class CreateBorrowRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :borrow_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :rejection_reason
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true

  scope :search_by_name, lambda {|name|
                           where("name LIKE ?", "%#{name}%") if name.present?
                         }
  scope :order_by_name_asc, ->{order(name: :asc)}
end

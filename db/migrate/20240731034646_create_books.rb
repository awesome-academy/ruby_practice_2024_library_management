class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :publication_year
      t.string :image_url

      t.timestamps
    end
  end
end

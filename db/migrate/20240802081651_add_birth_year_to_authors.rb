class AddBirthYearToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :birth_year, :string
  end
end

class AddProfilePictureUrlToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :profile_picture_url, :string
  end
end

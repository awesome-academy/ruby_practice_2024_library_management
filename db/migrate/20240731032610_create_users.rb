class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest
      t.boolean :role
      t.boolean :activated

      t.timestamps
    end
  end
end

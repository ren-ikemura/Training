class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, mull: false
      t.string :email, mull: false
      t.string :password_digest, mull: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid, limit: 255
      t.string :token
      t.string :secret
      t.string :name, limit: 255
      t.string :provider
      t.boolean :email

      t.timestamps
    end
    add_index :users, [:email], unique: true
  end
end

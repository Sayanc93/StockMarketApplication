class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :code
      t.string :security_id
      t.string :current_price, default: "0.0"
      t.string :percent_change, default: "0.0"
      t.boolean :high, default: false

      t.timestamps
    end
  end
end

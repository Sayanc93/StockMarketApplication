class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.references :user,          foreign_key: true, null: false
      t.references :company
      t.string :buying_stock_price, default: "0.0"
      t.string :number, default: "0.0"

      t.timestamps
    end
  end
end

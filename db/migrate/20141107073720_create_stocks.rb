class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :user, null: false
      t.references :product, null: false
      t.integer :amount, null: false
      t.decimal :price, precision: 7, scale: 2, null: false
      t.datetime :stocked_at, null: false
      t.timestamps
    end
  end
end

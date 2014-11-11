class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, null: false
      t.references :product, null: false
      t.integer :amount, limit: 1, null: false
      t.integer :price, precision: 7, scale: 2, null: false
      t.timestamps
    end
  end
end

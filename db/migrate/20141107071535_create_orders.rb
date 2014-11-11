class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, null: false
      t.integer :guests, limit: 1, null: false
      t.decimal :price, precision: 7, scale: 2, null: false
      t.datetime :ordered_at, :checked_at
      t.string :state, limit: 50, null: false
      t.text :remark
      t.boolean :trashed, default: false, null: false
      t.timestamps
    end
  end
end

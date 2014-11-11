class CreateProducts < ActiveRecord::Migration
  def change
    create_table :product do |t|
      t.string :uuid, limit: 36, null: false
      t.references :category, null: false
      t.string :chinese_name, limit: 500, null: false
      t.string :foreign_name, limit: 500, null: false
      t.string :image, limit: 500
      t.string :capacity, limit: 100
      t.string :unit, limit: 100, null: false
      t.decimal :price, precision: 7, scale: 2, null: false
      t.decimal :discount, precision: 3, scale: 2, default: 1, null: false
      t.boolean :available, null: false
      t.boolean :trashed, default: false, null: false
      t.timestamps
    end
  end
end

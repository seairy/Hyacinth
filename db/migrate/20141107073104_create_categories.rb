class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :uuid, limit: 36, null: false
      t.string :name, limit: 100, null: false
      t.timestamps
    end
  end
end

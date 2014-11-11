class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account, limit: 32, null: false
      t.string :hashed_password, limit: 100, null: false
      t.integer :role, limit: 1. null: false
      t.string :name, limit: 100, null: false
      t.string :token, limit: 100, null: false
      t.boolean :available, null: false
      t.datetime :last_signined_at, :current_signined_at
      t.boolean :trashed, default: false, null: false
      t.timestamps
    end
  end
end

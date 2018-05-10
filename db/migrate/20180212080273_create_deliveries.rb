class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.references :store, foreign_key: true
      t.integer :total_items
      t.decimal :total_cost, precision: 10, scale: 2
      t.decimal :total_price, precision: 10, scale: 2
      t.text :description, null: false
      t.boolean :status, default: false

      t.timestamps
    end
  end
end

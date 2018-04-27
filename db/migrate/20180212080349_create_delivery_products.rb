class CreateDeliveryProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_products do |t|
      t.references :delivery, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :cost, precision: 10, scale: 2, null: false
      
      t.timestamps
    end
  end
end

class CreateDeliveryProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_products do |t|
      t.references :delivery, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.decimal :cost, precision: 10, scale: 2
      
      t.timestamps
    end
  end
end

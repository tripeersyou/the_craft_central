class CreateBeginningInventoryProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :beginning_inventory_products do |t|
      t.references :product, foreign_key: true
      t.references :ending_inventory, foreign_key: true
      t.decimal :price, precision: 2, null: false
      t.integer :cost, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end

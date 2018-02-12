class CreateEndingInventoryProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :ending_inventory_products do |t|
      t.references :product, foreign_key: true
      t.references :ending_inventory, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

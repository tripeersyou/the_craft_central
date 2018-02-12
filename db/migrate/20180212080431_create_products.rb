class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku, null: false
      t.string :name, null: false
      t.text :description, default: ""
      t.integer :limit, null: false
      t.decimal :price, precision: 2, null: false
      t.integer :inventory, null: false

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end

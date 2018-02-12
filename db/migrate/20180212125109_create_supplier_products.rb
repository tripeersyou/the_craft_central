class CreateSupplierProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :supplier_products do |t|
      t.references :supplier, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end

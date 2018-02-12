class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :supplier, foreign_key: true
      t.integer :total_items

      t.timestamps
    end
  end
end

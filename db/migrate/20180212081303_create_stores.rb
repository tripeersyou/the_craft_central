class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.references :brand, foreign_key: true
      t.text :address, default: ""
      t.text :email, default: ""
      t.string :contact_person, default: ""
      t.string :contact_number, limit: 11

      t.timestamps
    end
  end
end

class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.text :address
      t.string :email, default: ""
      t.string :contact_person, default: ""
      t.string :contact_number, limit: 20, default: ""

      t.timestamps
    end
  end
end

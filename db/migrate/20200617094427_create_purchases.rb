class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :address, precision: 255
      t.string :phone_number, precision: 11
      t.string :name, precision: 30
      t.integer :status, default: 1
      t.timestamps
    end
  end
end

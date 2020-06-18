class CreateDetailpurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :detailpurchases do |t|
      t.integer :quantity
      t.references :purchase, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end

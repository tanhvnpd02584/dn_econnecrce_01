class AddUnitPriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :unit_price, :double
    add_column :products, :quantity, :integer
    add_column :products, :description, :string
  end
end

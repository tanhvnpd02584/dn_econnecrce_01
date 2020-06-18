class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, precision: 30, null: false
      t.string :email, precision: 30, null: false
      t.string :password_digest, precision: 20, null: false

      t.timestamps
    end
  end
end

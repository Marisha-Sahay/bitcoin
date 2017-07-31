class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      t.text :description
      t.string :size
      t.boolean :in_stock

      t.timestamps
    end
  end
end
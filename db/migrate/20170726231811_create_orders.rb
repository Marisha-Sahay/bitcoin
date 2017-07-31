class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal  :subtotal,   precision: 5, scale: 2
      t.decimal  :tax,        precision: 5, scale: 2
      t.decimal  :total,      precision: 5, scale: 2
      t.boolean  :complete 
      t.timestamps
    end
  end
end

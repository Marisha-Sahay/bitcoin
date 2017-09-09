class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.string :resource_link
      t.timestamps
    end
  end
end

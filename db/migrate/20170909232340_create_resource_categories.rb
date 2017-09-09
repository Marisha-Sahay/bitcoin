class CreateResourceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_categories do |t|
      t.integer :categorized_resource_id
      t.string :name
      t.timestamps
    end
  end
end

class CreateCategorizedResources < ActiveRecord::Migration[5.0]
  def change
    create_table :categorized_resources do |t|
      t.integer :resource_id
      t.integer :resource_category_id
      t.timestamps
    end
  end
end

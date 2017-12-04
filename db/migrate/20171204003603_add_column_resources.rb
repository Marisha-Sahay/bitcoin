class AddColumnResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :short_desc, :text
    add_column :resource_categories, :description, :text
  end
end

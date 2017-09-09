class RemoveColumnFromResourceCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :resource_categories, :categorized_resource_id, :integer
  end
end

class Changecolumnnameinvideo < ActiveRecord::Migration[5.0]
  def change
    remove_column :videos, :type
    add_column :videos, :video_type, :string
  end
end

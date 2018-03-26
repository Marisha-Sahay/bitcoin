class Addcolumntolatestnews < ActiveRecord::Migration[5.0]
  def change
    add_column :latest_news, :date_of_news, :datetime
  end
end

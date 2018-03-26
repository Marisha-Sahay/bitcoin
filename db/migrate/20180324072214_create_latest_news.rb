class CreateLatestNews < ActiveRecord::Migration[5.0]
  def change
    create_table :latest_news do |t|
      t.string :title
      t.string :description
      t.string :news_url
      t.string :category

      t.timestamps
    end
  end
end

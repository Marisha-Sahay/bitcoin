class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :news_url
      t.string :site_full
      t.text :title
      t.text :description
      t.timestamp :published
      t.string :main_image
      t.integer :performance_score
      t.integer :domain_rank
      t.integer :facebook_like
      t.integer :facebook_comment
      t.integer :facebook_share
      t.integer :linkedin_share
      t.string :author
      t.float :rating
      t.timestamps
    end
  end
end

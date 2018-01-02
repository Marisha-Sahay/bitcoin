class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :category
      t.string :link
      t.string :currency
      t.integer :score
      t.integer :length
      t.string :video_type

      t.timestamps
    end
  end
end

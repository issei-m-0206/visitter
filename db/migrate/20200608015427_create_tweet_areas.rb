class CreateTweetAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_areas do |t|
      t.references :tweet, foreign_key: true
      t.references :area, foreign_key: true
      t.timestamps
    end
  end
end

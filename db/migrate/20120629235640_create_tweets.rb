class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.string :hashtag
      t.string :bitly
      t.timestamps
    end
  end
end

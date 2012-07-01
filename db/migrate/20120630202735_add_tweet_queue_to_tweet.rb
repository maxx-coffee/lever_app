class AddTweetQueueToTweet < ActiveRecord::Migration
  def change
  	add_column :tweets, :tweet_queue_id, :integer
  end
end

class CreateTweetQueues < ActiveRecord::Migration
  def change
    create_table :tweet_queues do |t|
      t.string :time_period
      t.timestamp :last_run

      t.timestamps
    end
  end
end

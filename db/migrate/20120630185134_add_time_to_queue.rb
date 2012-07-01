class AddTimeToQueue < ActiveRecord::Migration
  def change
  	add_column :tweet_queues, :start_time, :time, :default => "00:00:00"
  	add_column :tweet_queues, :end_time, :time, :default => "00:00:00"
  end
end

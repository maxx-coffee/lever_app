class AddTweetIdToDelayedJobs < ActiveRecord::Migration
  def change
  	add_column :delayed_jobs, :tweet_id, :integer
  end
end

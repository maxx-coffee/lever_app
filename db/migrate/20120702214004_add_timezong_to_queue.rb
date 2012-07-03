class AddTimezongToQueue < ActiveRecord::Migration
  def change
  	add_column :tweet_queues, :timezone, :string
  end
end

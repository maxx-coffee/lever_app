class UpdateQueue < ActiveRecord::Migration
 def change
    add_column :tweet_queues, :admin_user_id, :integer
    add_column :tweet_queues, :token, :string
    add_column :tweet_queues, :secret, :string
end
end

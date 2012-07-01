class AddUserIdToTweet < ActiveRecord::Migration
def change
    add_column :tweets, :admin_user_id, :integer
end
end

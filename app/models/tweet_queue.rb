class TweetQueue < ActiveRecord::Base
  attr_accessible :token, :secret, :start_time,:end_time,:admin_user_id,:last_run
  belongs_to :admin_user
  has_many :tweets

  def self.new_queue(token, secret, user_id)
  	@queue = TweetQueue.find_or_create_by_admin_user_id(user_id)
  	@queue.token = token
  	@queue.secret = secret
  	@queue.admin_user_id = user_id
  	@queue.save!
  end

end

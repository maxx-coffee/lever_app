class TweetsController < ApplicationController
  def auth
  	omniauth = request.env["omniauth.auth"]
    @token = omniauth['credentials']['token']
    @secret = omniauth['credentials']['secret']
    TweetQueue.new_queue(@token,@secret, current_admin_user.id)
  end

  def send_tweet
  	Tweet.send_tweet
  end

  def show
  	@queue = TweetQueue.find(1)
  	@chronic = Chronic.parse('today') 
  end


  def schedule
  	Tweet.schedule_tweets
  end

  def delete_jobs
  	@jobs = Delayed::Job.find(:all)
  	@jobs.each do |job|
  		job.destroy
  	end
  end

end

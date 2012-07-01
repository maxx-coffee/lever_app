class Tweet < ActiveRecord::Base
   attr_accessible :tweet, :bitly,:hashtag, :tweet_id, :admin_user_id, :tweet_queue_id
   after_create  :check_schedule
   before_destroy :destroy_job
   belongs_to :admin_user
   belongs_to :tweet_queue

   def send_tweet(tweet)
      @tweet = tweet
      #update the status of the tweet

      Twitter.configure do |config|
          config.consumer_key = "Pgv7PXKoU7Fcs4wqDG6SA"
          config.consumer_secret = "46A306QLhQpmeUXB29hOD02FToOf21zWfls34sxFU"
          config.oauth_token = "610394291-fxGyLJBpYRN0tSuIG4rEoYfcEwWYNSSChEd831Vl"
          config.oauth_token_secret = "ksJz2LKYHS1VFT5gKjnXOyZRg52SCQAH8HJbOX6Rrms"
      end
      Twitter.update(@tweet.tweet)

    end


    def rand_time(from, to)
      Time.at(rand_in_range(from.to_f, to.to_f))
    end

    def rand_in_range(from, to)
      rand * (to - from) + from
    end

    def check_schedule
      #@jobs = Delayed::Job.find(:all, :conditions => ["queue=?", 1]).count
      #if @jobs <= 0
        self.schedule_tweets
     # end
    end

    def destroy_job
      @job = Delayed::Job.find(:all, :conditions => ["tweet_id=?", self.id])
      @job.each do |job|
        job.destroy
      end
    end

    def schedule_tweets
      @queue = TweetQueue.find(:all)
      
      @queue.each do |queue|
        
        queue.tweets.each do |tweet|
          time = rand_time(Chronic.parse('today '+queue.start_time.strftime('%H:%M').to_s).utc ,Chronic.parse('today '+queue.end_time.strftime('%H:%M').to_s).utc )
          self.delay(:run_at => time, :queue => '1', :tweet_id => tweet.id).send_tweet(tweet)
      end
      end
    end

end


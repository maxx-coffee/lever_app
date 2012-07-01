ActiveAdmin.register Tweet do

  form do |f|
      f.inputs "Tweet Tweet" do
        f.input :tweet
        f.input :bitly
        f.input :hashtag
      end
      f.buttons
  end
  controller do 

   	def create
   		@tweet = Tweet.new(params[:tweet])
  		@queue = current_admin_user.tweet_queue
  		@tweet.tweet_queue_id = @queue.id
  		@tweet.admin_user_id = current_admin_user.id
  		if @tweet.save
        	redirect_to {admin_tweet_url}
    	end
   	end

   end
end

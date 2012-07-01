class TweetQueuesController < ApplicationController
  def new
  	@queue = TweetQueues.new
  end
end
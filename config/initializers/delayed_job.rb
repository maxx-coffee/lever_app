class Delayed::Job < ActiveRecord::Base
  belongs_to :tweet, :polymorphic => true
  attr_accessible :tweet_id
end
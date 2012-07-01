class Settings < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.create_auth(token,secret)
  	@settings = Settings.new
  	@settings.twitter_token = token
  	@settings.twitter_secret = secret
  	@settings.save!
  end
end

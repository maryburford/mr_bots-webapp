class AccountController < ApplicationController
  def tweet 
    message = params['message']
    if message.length > 0
      Twitter.configure do |config|
	config.consumer_key = 
	config.consumer_secret = 
	config.oauth_token = self.token
	config.oauth_token_secret = self.secret
      end

      client = Twitter::Client.new
      client.update(message)
      current_user.tweet(message)
      redirect_to root_url, :notice => "I tweeted that." 
    else
      redirect_to root_url, :notice => "Uh, put some text there."
    end
  end
end

class AccountController < ApplicationController
  def tweet 
    if current_account
      message = params['message']
      if message.length > 0
	current_account.tweet(message)
	redirect_to root_url, :notice => "I tweeted that." 
      else
	redirect_to root_url, :notice => "Uh, put some text there."
      end
    end
  end
end

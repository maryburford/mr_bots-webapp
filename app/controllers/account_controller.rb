class AccountController < ApplicationController
  def tweet 
    puts("hi")
    if current_account
      message = params['message']
      if message.length > 0
	current_account.tweet(message)
	redirect_to root_url
      else
	redirect_to root_url
      end
    end
  end
end

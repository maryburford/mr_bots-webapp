class AccountController < ApplicationController
  def tweet 
    puts("hi")
    if current_account
      message = params['message']
      if message.length > 0
	current_account.tweet(message)
	redirect_to "http://google.com"
      else
	redirect_to "http://google.com"
      end
    end
  end
end

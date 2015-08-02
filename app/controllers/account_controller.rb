class AccountController < ApplicationController
  def tweet 
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

  def campaigns
    if !current_account
      redirect_to root_url
    end
    @campaigns = Campaign.all
  end
end

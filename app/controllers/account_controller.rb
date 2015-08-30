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
    @campaigns = Campaign.where(account_id: current_account.id).order("updated_at DESC")
    @new_followers = Hash.new(Array.new)
    @campaigns.each do |camp|
      @new_followers[camp.id] = Engagement.where("campaign_id = ? and isfollowing", camp.id).select(:user_name).distinct
    end

  end
end

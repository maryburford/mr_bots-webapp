class CampaignController < ApplicationController
  def create_form
      if !current_account
	redirect_to root_url
      end
  end

  def create 
      if !current_account
	redirect_to root_url
      end


    #TODO: validate target acct
    target = params["target"]
    account_id = params["account_id"]
    engagement_type = params["engagement_type"]
    engagements_per_day = params["engagements_per_day"]
    engagements_per_prey = params["engagements_per_prey"]

    @c = Campaign.new(target: target, 
                     active: true, 
		     account_id: account_id, 
                     engagement_type: engagement_type,
                     engagements_per_day: engagements_per_day,
                     engagements_per_prey: engagements_per_prey)

    @c.save
    if !@c.save then 
      redirect_to campaign_create_form_url, flash: { error_messages: @c.errors.full_messages, c: @c}
    else 
      redirect_to account_campaigns_url
    end
  end
end

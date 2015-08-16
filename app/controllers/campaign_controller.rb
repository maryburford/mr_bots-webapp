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

    #todo: make sure it is one of user's accounts

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

    if !@c.valid? then 
      redirect_to campaign_create_form_url, flash: { error_messages: @c.errors.full_messages, c: @c}
    else 
      Campaign.where(account_id: current_account.id).update_all(active: false)
      @c.save
      redirect_to account_campaigns_url
    end
  end

  def update
    if !current_account
      redirect_to root_url
    end

    #todo: make sure it is one of user's campaigns

    Campaign.where(account_id: current_account.id).update_all(active: false)
    c = Campaign.find(params[:campaign_id])
    c.update(active: params[:active])
    redirect_to root_url
  end

  def delete
    if !current_account
      redirect_to root_url
    end
    
    #todo: make sure it is one of user's campaigns
    Campaign.find(params[:campaign_id]).delete
    redirect_to root_url
  end

end


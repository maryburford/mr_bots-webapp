class CampaignController < ApplicationController
  def create_form
      if !current_account
	redirect_to root_url
      end
      @max_engagements_per_day = current_account.get_max_engagements_per_day()
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
    mr_score = params["mr_score"]


    @c = Campaign.new(target: target, 
                     active: true, 
		                 account_id: account_id, 
                     engagement_type: engagement_type,
                     engagements_per_day: engagement_type == "Clone" ? 1 : engagements_per_day,
                     engagements_per_prey: engagement_type == "Clone" ? 1 : engagements_per_prey,
                     mr_score: mr_score)

    if !@c.valid? then 
      redirect_to campaign_create_form_url, flash: { error_messages: @c.errors.full_messages, c: @c}
    else 
      Campaign.where("account_id = ? AND engagement_type = ?", current_account.id,
		  @c.engagement_type).update_all(active: false)
      @c.save
      redirect_to account_campaigns_url
    end
  end

  def update
    if !current_account
      redirect_to root_url
    end

    #todo: make sure it is one of user's campaigns

    c = Campaign.find(params[:campaign_id])
    Campaign.where("account_id = ? AND engagement_type = ?", current_account.id,
		  c.engagement_type).update_all(active: false)
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


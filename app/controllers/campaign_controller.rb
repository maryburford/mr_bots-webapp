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
        
          validation_error = False
          # TODO: validation
          target = params["target"]
          account_id = current_user.account_id
          engagement_type = params["engagement_type"]
          engagements_per_day = params["engagements_per_day"]
          engagements_per_prey = params["engagements_per_prey"]

          if !validation_error 
	    Campaign.create_campaign(target, account_id, engagement_type, engagements_per_day, engagements_per_prey)
	    redirect_to account_campaigns_url
          end
 
          redirect_to campaign_create_form_url
        end
end

class Campaign < ActiveRecord::Base
  def self.create_campaign(target, account_id, engagement_type, engagements_per_day, engagements_per_prey)  
    create! do |campaign|  
      campaign.target = target
      campaign.account_id = account_id
      campaign.engagement_type = engagement_type
      campaign.engagements_per_day = engagements_per_day
      campaign.engagements_per_prey = engagements_per_prey
    end
  end
end

class Campaign < ActiveRecord::Base
  validates :target, presence: true
  validates :engagements_per_day, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 30}
  validates :engagements_per_prey, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 30}
  validates :engagement_type, inclusion: { in: %w(Favorite) }

  def self.create_campaign(target, account_id, engagement_type, engagements_per_day, engagements_per_prey)  
    c = Campaign.new(target: target, 
                     active: true, 
		     account_id: account_id, 
                     engagement_type: engagement_type,
                     engagements_per_day: engagements_per_day,
                     engagements_per_prey: engagements_per_prey)
    c.save
    return c.errors
  end
end

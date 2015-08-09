class Campaign < ActiveRecord::Base
  validates :target, presence: true
  validates :engagements_per_day, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 30}
  validates :engagements_per_prey, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10}
  validates :engagement_type, inclusion: { in: %w(Favorite) }
end

class Campaign < ActiveRecord::Base
  validates :target, presence: true
  validates :account_id, presence: true
  validates :engagements_per_day, numericality: { only_integer: true, greater_than: 0}
  validates :engagements_per_prey, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10}
  validates :engagement_type, inclusion: { in: %w(Favorite Clone) }
  validate :target_valid

  def target_valid
    if target =~ /,/
      targets = target.split(',')
      for target in targets do
        if !Account.user_exists?(target) then
          errors.add(:target, "account is invalid")
        end
      end
    else
    if !Account.user_exists?(target) then
        errors.add(:target, "account is invalid")
      end
    end
  end

  def less_than_max_engagements
    if engagements_per_day > Account.find(account_id).get_max_engagements_per_day() then
      errors.add(:engagements_per_day, "greater than the maximum allowed value.")
    end
  end
end

MAX_FOR_TWITTER_OVER_365_DAYS_CONST = 312
MAX_FOR_TWITTER_OVER_120_DAYS_CONST = 225
MAX_FOR_TWITTER_OVER_30_DAYS_CONST = 100
MAX_FOR_TWITTER_OVER_7_DAYS_CONST = 30
MAX_FOR_TWITTER_UNDER_7_DAYS_CONST = 15


class Account < ActiveRecord::Base
  def self.create_or_update_with_omniauth(auth)  
    account = self.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if account then 
      account.name = auth["info"]["name"]
      account.image = auth["info"]["image"]
      account.email = auth["info"]["email"]
      account.nickname = auth["info"]["nickname"]
      account.token = auth["credentials"]["token"]
      account.secret = auth["credentials"]["secret"]
      account.account_creation_date = auth["extra"]["raw_info"]["created_at"]
      account.save
    else 
      create! do |account|  
	account.provider = auth["provider"]  
	account.uid = auth["uid"]  
	account.name = auth["info"]["name"]
	account.image = auth["info"]["image"]
	account.email = auth["info"]["email"]
	account.nickname = auth["info"]["nickname"]
	account.token = auth["credentials"]["token"]
	account.secret = auth["credentials"]["secret"]
        account.account_creation_date = auth["extra"]["raw_info"]["created_at"]
      end
    end
    return account
  end

  def self.user_exists?(username)
      client = Twitter::REST::Client.new do |config|
	config.consumer_key = "tdGB5bGdjqlM3hRVIA3VYY0n9"
	config.consumer_secret = "vaAejiob0uko8YPu81tTxB585cvA4G1WmKmwGLGESpMOw5MXxr"
      end
      
      begin 
        client.user(username)
	return true
      rescue Twitter::Error::NotFound
	return false
      rescue Twitter::Error
	return false
      end
  end

  def get_max_engagements_per_day()
    if self.provider = "twitter" and self.account_creation_date then 
      account_age = Time.new.to_date - self.account_creation_date.to_date
      account_age = account_age.to_i
      if account_age > 365 then
	return MAX_FOR_TWITTER_OVER_365_DAYS_CONST
      elsif account_age > 120 then
	return MAX_FOR_TWITTER_OVER_120_DAYS_CONST
      elsif account_age > 30 then 
	return MAX_FOR_TWITTER_OVER_30_DAYS_CONST
      elsif account_age > 7 then 
	return MAX_FOR_TWITTER_OVER_7_DAYS_CONST
      else 
	return MAX_FOR_TWITTER_UNDER_7_DAYS_CONST
      end
    end
    return MAX_FOR_TWITTER_UNDER_7_DAYS_CONST
  end

  def get_max_engagements_per_prey()
    return self.get_max_engagements_per_day()
  end
  
  def tweet(message)
      client = Twitter::REST::Client.new do |config|
	config.consumer_key = "tdGB5bGdjqlM3hRVIA3VYY0n9"
	config.consumer_secret = "vaAejiob0uko8YPu81tTxB585cvA4G1WmKmwGLGESpMOw5MXxr"
	config.access_token = self.token
	config.access_token_secret = self.secret
      end

      client.update(message)
  end


end

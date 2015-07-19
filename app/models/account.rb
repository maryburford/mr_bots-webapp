class Account < ActiveRecord::Base
	def self.create_with_omniauth(auth)  
    create! do |account|  
      account.provider = auth["provider"]  
      account.uid = auth["uid"]  
  #    account.name = auth["user_info"]["name"]
      account.token = auth["oauth_token"]
      account.secret = auth["oauth_token_secret"]
    end
  end
end

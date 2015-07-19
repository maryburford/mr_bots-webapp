class Account < ActiveRecord::Base
  def self.create_with_omniauth(auth)  
    create! do |account|  
      account.provider = auth["provider"]  
      account.provider_id = auth["uid"]  
      account.name = auth["user_info"]["name"]
      account.token = auth["oauth_token"]
      account.secret = auth["oauth_token_secret"]
    end
  end
  
  def tweet(message)
      Twitter.configure do |config|
	config.consumer_key = 'tdGB5bGdjqlM3hRVIA3VYY0n9'
	config.consumer_secret = 'vaAejiob0uko8YPu81tTxB585cvA4G1WmKmwGLGESpMOw5MXxr'
	config.oauth_token = self.token
	config.oauth_token_secret = self.secret
      end

      client = Twitter::Client.new
      client.update(message)
  end

end

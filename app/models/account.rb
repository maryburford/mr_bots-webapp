class Account < ActiveRecord::Base
  def self.create_with_omniauth(auth)  
    create! do |account|  
      account.provider = auth["provider"]  
      account.uid = auth["uid"]  
      account.name = auth["info"]["name"]
      account.token = auth["credentials"]["token"]
      account.secret = auth["credentials"]["secret"]
    end
  end
  
  def tweet(message)
      client = Twitter::REST::Client.new do |config|
	config.consumer_key = "tdGB5bGdjqlM3hRVIA3VYY0n9"
	config.consumer_secret = "vaAejiob0uko8YPu81tTxB585cvA4G1WmKmwGLGESpMOw5MXxr"
	config.access_token = self.token
	config.access_token_secret = self.secret
      end

      puts(self.token);
      puts(self.secret);
      client.update(message)
  end

end

class Account < ActiveRecord::Base
  def self.create_with_omniauth(auth)  
    puts(auth)
    create! do |account|  
      account.provider = auth["provider"]  
      account.uid = auth["uid"]  
      account.name = auth["info"]["name"]
      account.image = auth["info"]["image"]
      account.email = auth["info"]["email"]
      account.nickname = auth["info"]["nickname"]
      account.token = auth["credentials"]["token"]
      account.secret = auth["credentials"]["secret"]
    end
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

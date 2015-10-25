class SessionsController < ApplicationController
  def create  
    auth = request.env["omniauth.auth"]  
    account = Account.create_or_update_with_omniauth(auth)  
    session[:account_uid] = account.uid
    redirect_to root_url  
  end  
 
  def destroy
    session[:account_uid] = nil
    redirect_to root_url
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_account
    
  private  
  def current_account  
    @current_account ||= Account.find_by_uid(session[:account_uid]) if session[:account_uid]  
  end  
end

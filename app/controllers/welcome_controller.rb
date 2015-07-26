class WelcomeController < ApplicationController
  def index
    if current_account
      redirect_to account_campaigns_url
    end
  end
end

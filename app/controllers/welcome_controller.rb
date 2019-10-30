class WelcomeController < ApplicationController
  before_action :redirect_to_dashboard

  private

  def redirect_to_dashboard
    if current_user
      redirect_to current_user_index_url
    end
  end
end

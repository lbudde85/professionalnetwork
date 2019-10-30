class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :current_user_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email, :user_type, :password, :password_confirmation, :company_name,
      :first_name, :last_name, :country_id, :tos_confirmed
    ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
      :password, :password_confirmation, :company_name, :first_name, :last_name, :country_id
    ])
  end

  def current_user_layout
    if current_user
      current_user.user_type
    else
      'default'
    end
  end

  def current_user_index_url
    if not current_user
      return root_url
    end

    if current_user.agent?
      return agent_url
    elsif current_user.brand?
      return brand_url
    elsif current_user.distributor?
      return distributor_url
    end

    # Something strange happen - unknown user type
    raise ActionController::RoutingError.new('Not Found')
  end

  def authenticate_brand!
    authenticate_or_redirect 'brand?'
  end

  def authenticate_distributor!
    authenticate_or_redirect 'distributor?'
  end

  def authenticate_agent!
    authenticate_or_redirect 'agent?'
  end

  private

  def authenticate_or_redirect(method_name)
    authenticate_user!

    if not current_user.send(method_name)
      sign_out :user
      redirect_to root_url
    elsif not current_user.tos_confirmed
      sign_out :user
      flash.discard
      flash[:warning] = "You have not confirmed the Terms and Services! Please contact us for more details!"
      redirect_to root_url
    end
  end
end

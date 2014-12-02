class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
include PublicActivity::StoreController
# ...
hide_action :current_user
#@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followers, owner_type: "User")
  def configure_permitted_parameters
    ## Permit the custom fields below which you would like to update, I have shown a few examples 
    devise_parameter_sanitizer.for(:account_update) << :LastName << :firstName<< :avatar
    devise_parameter_sanitizer.for(:sign_up) << :LastName << :firstName << :avatar
    
  end
  def after_sign_in_path_for(resource)
   
  if current_user.admin
    rails_admin.dashboard_path
  else
   root_path
  end
    #request.env['omniauth.origin'] || stored_location_for(resource) || root_path
   
  end
  protect_from_forgery with: :exception

  def avatar_url(user)
  if user.avatar_url.present?
    user.avatar_url
  else
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
  

end

end

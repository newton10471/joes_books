class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access denied."
  	redirect_to root_url
  end

  # credit to http://stackoverflow.com/questions/5629480/rails-devise-is-there-a-way-to-ban-a-user-so-they-cant-login-or-reset-their
  before_filter :user_blocked?

  def user_blocked?
    if current_user.present? && current_user.blocked?
      sign_out current_user
      flash[:notice] = "This account is blocked.  Accounts are blocked on signup; if you just signed up an email was sent to the site admins to approve your user id creation."
      root_path
    end
  end
end

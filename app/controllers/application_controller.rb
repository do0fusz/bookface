class ApplicationController < ActionController::Base
  helper_method :requests_count
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 
  
  def requests_count
    current_user.pending_friend_requests_from.map(&:user).size 
  end

end

class ApplicationController < ActionController::API
  # equivalent of authenticate_user! on devise, but this one will check the oauth token
  before_action :doorkeeper_authorize!

  private

  # helper method to access the current user from the token
  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
  end

  def employer?
    employers = [
    "employer1@montecinema.com", 
    "employer2@montecinema.com", 
    "employer3@montecinema.com",
    "employer4@montecinema.com",
    "employer5@montecinema.com",
  ]
    @current_user.email.in?(employers)
  end
end

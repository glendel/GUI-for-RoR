# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # With this line we ensure that only an authenticated user will be able to use the application.
  before_filter :authenticate_user!
  
  # With this line we ensure that the authorization happens on every action in the application.
  #check_authorization
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # With this line we should receive some emails when something goes wrong.
  # TODO : Test if we need to put this line starting the class. Will the errors on the helpers cached ?
  include ExceptionNotification::Notifiable
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
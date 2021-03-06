# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # With this line we ensure that only an authenticated user will be able to use the application.
  before_filter :authenticate_user!
  
  # This method will be invoked to load and set convenient data for the general application.
  before_filter :load_and_set_settings
  
  # With this line we ensure that the authorization happens on every action in the application.
  check_authorization :if => :check_authorization?
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # This line invokes the "set_layout" method to choose the right layout according to each situation.
  layout :set_layout
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging :password, :password_confirmation
  
  # Exceptions handlers
  if ( Rails.env == 'production' )
    rescue_from Exception, :with => :rescue_from_exception
    rescue_from CanCan::AccessDenied, :with => :rescue_from_cancan
  end
  
  protected
    #----------------------------------------------------------------------------------------------------
    # load_and_set_settings
    #----------------------------------------------------------------------------------------------------
    def load_and_set_settings
      if ( devise_controller? )
        if ( controller_name == 'registrations' )
          authorize! action_name.to_sym, current_user
        elsif ( controller_name == 'passwords' )
          unless ( action_name == 'new' || request.post? )
            authorize! action_name.to_sym, current_user
          end
        end
      end
      
      User.current = current_user
    end
    
    #----------------------------------------------------------------------------------------------------
    # current_ability
    # 
    # This method is to override the original one used by "CanCan" to create and return the current_user's ability.
    #----------------------------------------------------------------------------------------------------
    def current_ability
      @current_ability ||= UserAbility.new( current_user )
    end
    
    #----------------------------------------------------------------------------------------------------
    # check_authorization?
    #----------------------------------------------------------------------------------------------------
    def check_authorization?
      if ( devise_controller? )
        if ( controller_name == 'sessions' )
          return( false )
        elsif ( controller_name == 'passwords' )
          if ( action_name == 'new' || request.post? )
	    return( false )
	  end
        end
      end
      
      return( true )
    end
    
    #----------------------------------------------------------------------------------------------------
    # set_layout
    #----------------------------------------------------------------------------------------------------
    def set_layout
      return( ( request.xhr? ) ? nil : :application )
    end
    
    #----------------------------------------------------------------------------------------------------
    # rescue_from_exception
    #----------------------------------------------------------------------------------------------------
    def rescue_from_exception( exc )
      Error.save( exc, request, current_user )
      
      if ( exc.instance_of?( ActionController::RoutingError ) )
        flash.now[:error] = 'We\'re sorry, but the page you were looking for doesn\'t exist.<br />We\'ve been notified about this issue and we\'ll take a look at it shortly,<br />but you may have mistyped the address or the page may have moved.'.html_safe
        render( 'errors/404' )
      else
        flash.now[:error] = 'We\'re sorry, but something went wrong.<br />We\'ve been notified about this issue and we\'ll take a look at it shortly.'.html_safe
        render( 'errors/500' )
      end
    rescue Exception => exc
      raise
    end
    
    #----------------------------------------------------------------------------------------------------
    # rescue_from_cancan
    #----------------------------------------------------------------------------------------------------
    def rescue_from_cancan( exc )
      redirect_to( new_user_session_path( :unauthenticated => true ) )
    end
end
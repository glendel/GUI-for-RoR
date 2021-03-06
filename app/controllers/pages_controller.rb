class PagesController < ApplicationController
  skip_authorization_check
  
  #----------------------------------------------------------------------------------------------------
  # index
  #----------------------------------------------------------------------------------------------------
  def index
    dashboard
  end
  
  #----------------------------------------------------------------------------------------------------
  # dashboard
  #----------------------------------------------------------------------------------------------------
  def dashboard
    respond_to do |format|
      format.html { render( :dashboard ) } # dashboard.html.erb
    end
  end
end

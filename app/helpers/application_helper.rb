# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #----------------------------------------------------------------------------------------------------
  # csrf_meta_tag
  #----------------------------------------------------------------------------------------------------
  def csrf_meta_tag
    if ( protect_against_forgery? )
      out = %( <meta name="csrf-param" content="%s"/>\n )
      out << %( <meta name="csrf-token" content="%s"/> )
      out % [ Rack::Utils.escape_html( request_forgery_protection_token ),
                  Rack::Utils.escape_html( form_authenticity_token ) ]
    end
  end
  
  #----------------------------------------------------------------------------------------------------
  # set_page_title
  #----------------------------------------------------------------------------------------------------
  def set_page_title( title )
    content_for( :title ) do
      title
    end
  end
end

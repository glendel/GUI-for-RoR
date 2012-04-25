require 'pp'

class Error < ActiveRecord::Base
  #----------------------------------------------------------------------------------------------------
  # self.save
  #----------------------------------------------------------------------------------------------------
  def self.save( exc, request, user )
    attributes = {
      :name => ( exc.name rescue '"exc.name" failed !' ),
      :message => ( exc.message rescue '"exc.message" failed !' ),
      :url => ( request.url rescue '"request.url" failed !' ),
      :ip_address => ( request.remote_ip rescue '"request.remote_ip" failed !' ),
      :parameters => ( request.filtered_parameters.inspect rescue '"request.filtered_parameters.inspect" failed !' ),
      :rails_root => ( Rails.root rescue '"Rails.root" failed !' ),
      :user_id => ( user.id rescue 0 ),
      :backtrace => ( exc.backtrace.join( "\n" ) rescue '"exc.backtrace.join( "\n" )" failed !' ),
      :session_id => ( ( request.ssl? ) ? '[FILTERED]' : ( request.session[ 'session_id' ].inspect rescue '"request.session[ \'session_id\' ].inspect" failed !' ) ),
      :session_data => ( PP.pp( request.session, '' ) rescue '"PP.pp( request.session, \'\' )" failed !' ),
      :filtered_env => ( request.filtered_env.inspect rescue '"request.filtered_env.inspect" failed !' ),
      :process => ( $$ rescue '"$$" failed !' ),
      :server => ( `hostname -s`.chomp rescue '"`hostname -s`.chomp" failed !' )
    }
    
    error = new( attributes )
    error.save!
  rescue Exception => exc
    
  end
end

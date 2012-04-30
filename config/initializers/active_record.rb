# http://oldwiki.rubyonrails.org/rails/pages/ExtendingActiveRecordExample
class ActiveRecord::Base
  include Userstamped
end

connection = ActiveRecord::Base.connection
class << connection
  alias :original_exec :execute
  def execute( sql, *name )
    begin
      Dir.mkdir( QueryLog::PATH ) unless ( File.exist?( QueryLog::PATH ) )
      query_log_file = File.join( QueryLog::PATH, "#{Time.now.strftime( '%Y-%m-%d' )}.log" )
      add_header = !File.exist?( query_log_file )
      logger = Logger.new( query_log_file )
      user_id = ( User.current.instance_of?( User ) ) ? User.current.id : 0
      logger.info( "user_id#{QueryLog::SEPARATOR}name#{QueryLog::SEPARATOR}sql#{QueryLog::SEPARATOR}created_at" ) if ( add_header )
      logger.info( "#{user_id}#{QueryLog::SEPARATOR}#{name}#{QueryLog::SEPARATOR}#{sql}#{QueryLog::SEPARATOR}#{Time.now}" )
    rescue Exception => e
    end
    # Execute the original statement.
    original_exec( sql, *name )
  end
end

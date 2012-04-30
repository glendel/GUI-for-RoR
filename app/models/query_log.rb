class QueryLog < ActiveRecord::Base
  PATH = File.join( Rails.root, 'log', 'query_logs' )
  SEPARATOR = '{#SEP#}'
end

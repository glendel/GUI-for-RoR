# TODO : If we upgrade to Rails 3 we should remove this file and add the lines below to the "config/application.rb" file.
# JavaScript files you want as :defaults (application.js is always included).
# config.action_view.javascript_expansions[:defaults] = %w( jquery rails )
#config.action_view.javascript_expansions[:defaults] = %w( jquery/jquery.rails )
module ActionView::Helpers::AssetTagHelper
  # Before remove on Rails 2.3.12 : ["prototype", "effects", "dragdrop", "controls"]
  remove_const :JAVASCRIPT_DEFAULT_SOURCES if ( defined?( JAVASCRIPT_DEFAULT_SOURCES ) )
  JAVASCRIPT_DEFAULT_SOURCES = %w( jquery/jquery.rails )
  reset_javascript_include_default
end
# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cms_session',
  :secret      => '3034015b04a2a294e41441b007d14a324a0c081ead215ec163c5e12c1ec9d88a878dee4aa571bbd4f50463ea9d10ccf7094527f0df9a07314ad6a2b7af5eb3b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

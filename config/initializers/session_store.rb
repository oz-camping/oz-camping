# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oz_session',
  :secret      => '0287e1150baf61d7d28f471ed1cc0b5086728f038d0a3f54f4d4a8adce8dd9a29d9230472d06bb4931e4e440804ed0c6122410d3668a037e88e58c4a8ed75b62'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

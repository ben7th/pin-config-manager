# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pin-config-manager_session',
  :secret      => '713dd66d421f103afaefd552e4a23036780240de89b441f05974909bc2b9266e04efc7497a2d6bd58953cf24ffb68bf3b2c5f183f715f43dedb4baa81aaabe5a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

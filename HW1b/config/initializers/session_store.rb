# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HW1_session',
  :secret      => 'e2835767c6a936b206f94e632068446f609cbcf873e7648684fc988b8135ea731ab4abfd460f3f441538b8ec7c46652fd532c7902fe7dc38f807964a70ddf753'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

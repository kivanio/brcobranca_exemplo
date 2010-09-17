# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_brcobranca_teste_session',
  :secret      => '045764e9a3d5dbdd490309d258e94e6f813c2e12b9ee55760386145c3e5ec8c56a255292b4520446bd56082efda244ed949d4d5ea81ec901d09b1b4b52063d11'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

Rails.application.config.session_store :cookie_store, 
  key: '_rubyandrails_session', 
  domain: :all, 
  same_site: :strict,
  secure: :true,
  tld_length: 2

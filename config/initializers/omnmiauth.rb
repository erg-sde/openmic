Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('google_id'),
  ENV.fetch('google_secret'),{scope:'email, profile'}

  #provider :facebook, Env.fetch, scope: ''
end

OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('google_id'),
  ENV.fetch('google_secret'),{scope:'email, profile'}
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']


  #provider :facebook, Env.fetch, scope: ''
end

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
 OmniAuth.config.full_host = Rails.env.production? ? 'https://di-airbnb.herokuapp.com/' : 'http://localhost:3000'
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    Rails.application.secrets.google_client_id,
    Rails.application.secrets.google_client_secret,
    {
      :name => "google"
    }
  provider :github,
    Rails.application.secrets.github_client_id,
    Rails.application.secrets.github_client_secret
  provider :twitter,
    Rails.application.secrets.twitter_api_key,
    Rails.application.secrets.twitter_api_secret
end

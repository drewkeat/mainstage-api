# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # BEFOREDEPLOY: Change for deploy
    origins 'http://localhost:3000'
    # origins 'http://themainstage.herokuapp.com'

    resource '*',
      expose: ["jwt"],
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource '/graphql', headers: :any, methods: [:post]
  end
end
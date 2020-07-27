require "hanami/api"

module HTTP
  class App < Hanami::API
    get "/health", to: Container['http.health.get']
  end
end

require "hanami/api"

module HTTP
  class App < Hanami::API
    use Datadog::Contrib::Rack::TraceMiddleware

    get "/health", to: Container['http.actions.health.get']
  end
end

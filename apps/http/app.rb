require "hanami/api"
require "hanami/action"
require 'hanami/controller/configuration'

# We need it for actions
#
# Docs for hanami actions:
#   https://github.com/hanami/controller/tree/4bbf1a046f3fa567db77d4cfc1d400fd330f7daa
Container.register('hanami.action.configuration', Hanami::Controller::Configuration.new)

module HTTP
  class App < Hanami::API
    use Datadog::Contrib::Rack::TraceMiddleware

    get "/health", to: Container['http.actions.health.get']
  end
end

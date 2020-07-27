# frozen_string_literal: true

require "bundler/setup"
require "hanami/api"
require 'ddtrace'

require_relative 'config/enviroment'

Datadog.configure do |c|
  c.use :rack, application: 'ms-boilerplate'
end

use Datadog::Contrib::Rack::TraceMiddleware

class App < Hanami::API
  get "/health" do
    status 200
  end
end

run App.new

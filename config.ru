# frozen_string_literal: true

require "bundler/setup"
require 'ddtrace'

require_relative 'config/enviroment'
require_relative 'apps/http/app'

Datadog.configure do |c|
  c.use :rack, application: 'ms-boilerplate'
end

use Datadog::Contrib::Rack::TraceMiddleware

run Container['http.app']

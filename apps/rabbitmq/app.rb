require_relative '../../lib/consumer/base'

module Rabbitmq
  class App < Core::Consumer::Base
    include Import[:bunny, 'bunny.connection', :logger]

    # [queue, event_name, version]
    consume ['hello', 'test', 1], to: Container['rabbitmq.consumers.employees.created.v1']
  end
end

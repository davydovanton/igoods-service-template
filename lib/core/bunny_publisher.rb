module Core
  class BunnyPublisher
    attr_reader :exchange

    def initialize(channel)
      @exchange = channel.default_exchange
    end

    def call(queue_name, event)
      exchange.publish(event.to_json, routing_key: queue_name)
    end
  end
end

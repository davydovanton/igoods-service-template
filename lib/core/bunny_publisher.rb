require 'dry/monads/result'
require 'dry/monads/do'
require 'dry/monads/do/all'

module Core
  class BunnyPublisher
    include Dry::Monads::Result::Mixin
    include Dry::Monads::Do::All

    attr_reader :exchange

    def initialize(channel)
      @exchange = channel.default_exchange
    end

    def call(queue_name:, event_name:, version:, data:)
      # validation
      # yield validate(event, 'billing.refund', version: 1).to_monad
      Success(exchange.publish(event.to_json, routing_key: queue_name))
    end

  private

    def validate(event, event_name, version)
      result = SchemaRegistry.validate_event(event, event_name, version: version)

      result.success? ? Success(event) : Failure(result.failure)
    end
  end
end

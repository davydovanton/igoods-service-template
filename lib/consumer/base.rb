# Experemental class for make same developer API as a hanami-api
module Core
  module Consumer
    class Base
      def self.consume(event_type, to:)
        @routes ||= {}
        @routes[event_type] = to
      end

      def start(queue_name)
        begin
          logger.info 'Waiting for messages. To exit press CTRL+C'
          consume(bunny.queue(queue_name))

          # TODO: if you want to handle common errors - do it here
        rescue Interrupt => _
          logger.info 'Closing connection'

          connection.close

          exit(0)
        end
      end

    private

      def self.routes
        @routes
      end

      def consume(queue)
        queue.subscribe(block: true) do |delivery_info, properties, body|
          consumer = delivery_info[:consumer]

          logger.tagged(consumer_tag: consumer.consumer_tag) do
            route(consumer.queue.name, JSON.parse(body, symbolize_names: true))
          end
        end
      end

      def route(queue, event)
        event_type = [queue, event[:event_name], event[:event_version]]

        if consumer = self.class.routes[event_type]
          logger.info "Calling: #{queue}, #{event}"
          consumer.call(event)
        else
          logger.info 'WRONG EVENT'
        end
      end
    end
  end
end

module Rabbitmq
  class App
    include Import[
      :bunny, 'bunny.connection',
      'rabbitmq.routing',
      :logger
    ]

    def start(queue_name)
      begin
        logger.info 'Waiting for messages. To exit press CTRL+C'
        consume_queue(bunny.queue(queue_name))
      rescue Interrupt => _
        logger.info 'Closing connection'

        connection.close

        exit(0)
      end
    end

  private

    def consume_queue(queue)
      queue.subscribe(block: true) do |delivery_info, properties, body|
        consumer = delivery_info[:consumer]

        logger.tagged(consumer_tag: consumer.consumer_tag) do
          routing.call(consumer.queue.name, JSON.parse(body, symbolize_names: true))
        end
      end
    end
  end
end

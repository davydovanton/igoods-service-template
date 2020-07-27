module Rabbitmq
  class Routing
    include Import[:logger]

    def call(queue, event)
      event_type = [queue, event[:event_name], event[:event_version]]

      case event_type
      in ['hello', 'test', 1]
        logger.info "Calling: #{queue}, #{event}"
      else
        logger.info 'WRONG EVENT'
      end
    end
  end
end

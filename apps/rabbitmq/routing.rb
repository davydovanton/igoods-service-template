module Rabbitmq
  class Routing
    include Import[
      :logger,
      employees_created_v1: 'rabbitmq.consumers.employees.created.v1'
    ]

    def call(queue, event)
      event_type = [queue, event[:event_name], event[:event_version]]

      case event_type
      in ['hello', 'test', 1]
        logger.info "Calling: #{queue}, #{event}"
        employees_created_v1.call(event)
      else
        logger.info 'WRONG EVENT'
      end
    end
  end
end

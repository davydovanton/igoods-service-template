module Rabbitmq
  module Consumers
    module Employees
      module Created
        class V1
          include Import[:logger]

          def call(event)
            logger.info event

            # call bussiness operation here, it's just a transport layer
          end
        end
      end
    end
  end
end

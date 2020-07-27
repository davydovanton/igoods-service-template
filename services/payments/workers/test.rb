require 'que'

# How to call
#   Container['payments.workers.test'].enqueue(user_id: 3)

module Payments
  module Workers
    class Test < Que::Job
      include Import[:logger]

      def run(user_id)
        logger.info "user_id: #{user_id}"
      end
    end
  end
end

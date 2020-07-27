require "hanami/action"

module HTTP
  module Actions
    module Health
      class Get < Hanami::Action
        include Import[
          'hanami.action.configuration'
        ]

        def handle(req, res)
          res.status  = 200
          res.body    = "OK"
        end
      end
    end
  end
end

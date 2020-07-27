module HTTP
  module Actions
    module Health
      class Get
        def call(env)
          [200, {}, ['OK']]
        end
      end
    end
  end
end

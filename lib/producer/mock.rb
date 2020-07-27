module Producer
  class Mock
    def call(queue_name:, event_name:, version:, data:)
      # validate(event, 'billing.refund', version: 1)
    end

  private

    def validate(event, event_name, version)
      result = SchemaRegistry.validate_event(event, event_name, version: version)

      result.success? ? Success(event) : Failure(result.failure)
    end
  end
end



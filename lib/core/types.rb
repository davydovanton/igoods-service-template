require 'dry-types'

# Module with all project types
#
# {http://dry-rb.org/gems/dry-types/ Dry-types documentation}
module Core
  module Types
    include Dry.Types()

    # System types
    LoggerLevel = Symbol.constructor(proc { |value| value.to_s.downcase.to_sym })
      .default(:info)
      .enum(:trace, :unknown, :error, :fatal, :warn, :info, :debug)

    ProjectApps = Array.constructor(proc { |value| value.to_s.downcase.split(',') }).of(Types::String)

    UUID = Strict::String.constrained(
      format: /\A(\h{32}|\h{8}-\h{4}-\h{4}-\h{4}-\h{12})\z/
    )
  end
end

require 'dry/system/container'
require_relative '../lib/core/types'
require_relative '../lib/core/operation'

# General container class for project dependencies
#
# {http://dry-rb.org/gems/dry-system/ Dry-system documentation}
class Container < Dry::System::Container
  # use :bootsnap
  use :env

  configure do |config|
    ENV['PROJECT_ENV'] ||= 'development'
    config.env = ENV['PROJECT_ENV']
  end

  load_paths!('system', 'lib', 'services', 'apps')

  auto_register!('lib') do |config|
    config.memoize = true
    config.instance(&:instance)

    # config.exclude do |component|
    #   component.path =~ /entities/
    # end
  end

  auto_register!('apps/http') do |config|
    config.memoize = true
    config.instance(&:instance)
  end

  auto_register!('services/payments') do |config|
    config.memoize = true
    config.instance(&:instance)
  end
end

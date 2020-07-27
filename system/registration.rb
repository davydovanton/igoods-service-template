class Container
  auto_register!('lib') do |config|
    config.memoize = true
    config.instance(&:instance)

    config.exclude do |component|
      component.path =~ /consumer/
    end
  end

  # business logic
  auto_register!('services/payments') do |config|
    config.memoize = true
    config.instance(&:instance)
  end

  # transport layer
  if self[:settings].project_apps.include?('http')
    auto_register!('apps/http') do |config|
      config.memoize = true
      config.instance(&:instance)
    end
  end

  if self[:settings].project_apps.include?('rabbitmq')
    auto_register!('apps/rabbitmq') do |config|
      config.memoize = true
      config.instance(&:instance)
    end
  end
end

class Container
  auto_register!('lib') do |config|
    config.memoize = true
    config.instance(&:instance)

    # config.exclude do |component|
    #   component.path =~ /entities/
    # end
  end

  # business logic
  auto_register!('services/payments') do |config|
    config.memoize = true
    config.instance(&:instance)
  end

  # transport layer
  auto_register!('apps/http') do |config|
    config.memoize = true
    config.instance(&:instance)
  end
end

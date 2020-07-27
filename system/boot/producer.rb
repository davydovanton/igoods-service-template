Container.boot(:producer) do |container|
  init do
    # if container[:producer] == 'mock'
    #   register('event.producer', Producer::Mock.new)
    # else
    use :bunny

    register('event.producer', Producer::BunnyPublisher.new(container[:bunny]))
    # end
  end
end

Container.boot(:producer) do |container|
  init do
    use :bunny

    register('event.producer', Core::BunnyPublisher.new(container[:bunny]))
  end
end

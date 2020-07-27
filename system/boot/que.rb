Container.boot(:que) do |container|
  init do
    use :persistence

    require 'que'
    Que.connection = container['persistence.container'].gateways[:default].connection
  end
end

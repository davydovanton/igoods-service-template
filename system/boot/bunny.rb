Container.boot(:bunny) do |container|
  init do
    require "bunny"
    use :settings

    conn = Bunny.new
    conn.start

    register('bunny.connection', conn)
    register('bunny', conn.create_channel)
  end

  stop do
    bunny.close
  end
end

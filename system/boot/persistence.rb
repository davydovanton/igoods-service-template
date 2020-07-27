Container.boot(:persistence) do |container|
  unless container[:settings].project_app == 'rake'
    init do
      use :db
      config = container['db.config']
      config.auto_registration(container.root + "lib/persistance")

      register('persistence.container', ROM.container(config))
    end
  end
end

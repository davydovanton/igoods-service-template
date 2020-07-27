PROJECT_APP='rake'
require_relative 'config/enviroment'
require 'rom-sql'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    Container.start(:db)

    ROM::SQL::RakeSupport.env = ROM.container(Container['db.config']) do |config|
      config.gateways[:default].use_logger(Container[:logger])
    end
  end
end

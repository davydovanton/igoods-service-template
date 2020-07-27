# frozen_string_literal: true

require "bundler/setup"
PROJECT_APP='rabbitmq'

require_relative 'config/enviroment'

Container['rabbitmq.app'].start('hello')

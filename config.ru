# frozen_string_literal: true

require "bundler/setup"

require_relative 'config/enviroment'

run Container['http.app']

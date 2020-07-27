require "dotenv"
Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")

require 'ddtrace'
require_relative '../system/container'
Container.finalize!

require "dotenv"
Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")

require_relative '../system/container'
Container.finalize!

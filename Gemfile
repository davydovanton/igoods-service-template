# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.0'

# http layer
gem 'puma', '~> 3.12.4'
gem 'hanami-api'
gem "hanami-controller", git: "https://github.com/hanami/controller.git", tag: "v2.0.0.alpha1"
gem 'ddtrace'

# persistance layer
gem 'pg'
gem 'sequel', '~> 4.49.0'
gem 'rom', '~> 5.2.4'
gem 'rom-sql', '~> 3.2.0'

# Monitoring and logging
gem 'rollbar'
gem 'semantic_logger'

# dependency managment
gem 'dry-system'

# business logic section
gem 'dry-monads'
gem 'dry-validation'

# Message broker
gem "bunny", ">= 2.9.2"

# Background processing
gem 'que'

# Other
gem 'bigdecimal', '1.4.2'
gem 'rake'
gem 'dry-cli'

group :development do
end

group :test, :development do
  gem 'dotenv', '~> 2.4'

  # data generation and cleanup
  gem 'database_cleaner'

  # style check
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
end

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-json', require: false

  gem 'rom-factory'
end

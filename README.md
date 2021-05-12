# Igoods service template

## How to setup application

```
$ bundle install
$ createdb outpayment_test
$ createdb outpayment_development
```

## DB rake commands

```
# creates a new migration file
$ bundle exec rake "db:create_migration[migration_name]"

# runs pending migrations
$ bundle exec rake db:migrate

# cleans the database
$ bundle exec rake db:clean

# drops tables and re-runs migrations
$ bundle exec rake db:reset
```

## Service commands

```
$ bin/service -h
```

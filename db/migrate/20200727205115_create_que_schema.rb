# frozen_string_literal: true

require 'que'

ROM::SQL.migration do
  up do
    Que.connection = self
    Que.migrate!(version: 3)
  end

  down do
    Que.connection = self
    Que.migrate!(version: 0)
  end
end

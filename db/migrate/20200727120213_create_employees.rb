# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :employees do
      primary_key :id

      column :public_id, String
      column :phone, String
      column :default_provider, String
      column :full_name, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

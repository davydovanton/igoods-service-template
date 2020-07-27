# Docs: https://rom-rb.org/learn/factory/0.10/
#
# How to call:
#   Factory[:employee, full_name: 'New name']
Factory.define(:employee) do |f|
  f.public_id '123test321'
  f.phone '+79996663311'
  f.full_name 'Anton Test'
  f.default_provider 'mock'
end

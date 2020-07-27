module Payments
  module Repositories
    class Employees < Persistance::Repository[:employees]
      struct_namespace Payments::Entities
    end
  end
end

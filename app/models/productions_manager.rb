class ProductionsManager < ApplicationRecord
  belongs_to :manager, class_name: "User"
  belongs_to :managed_production, class_name: "Production"
end

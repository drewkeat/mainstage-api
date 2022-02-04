class Production < ApplicationRecord
  has_many :productions_managers, foreign_key: :managed_production_id
  has_many :managers, through: :productions_managers, source: :manager
end

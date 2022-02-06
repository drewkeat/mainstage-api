class Production < ApplicationRecord
  has_many :productions_managers, foreign_key: :managed_production_id
  has_many :managers, through: :productions_managers, source: :manager
  has_many :roles
  has_many :roles_with_applicants, -> { joins{:applications}.where("application_id = ?", role.id)}
  has_many :unfilled_roles, ->{ joins{:applications}}
  has_many :company_members, through: :roles, source: :user
  has_many :applications
  has_many :applicants, through: :applications, source: :user

end

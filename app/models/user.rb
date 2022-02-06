class User < ApplicationRecord
  has_many :productions_managers, foreign_key: :manager_id
  has_many :managed_productions, through: :productions_managers, source: :managed_production
  has_many :roles
  has_many :productions, through: :roles
  has_many :applications

  has_secure_password
  before_save :normalize_names, :set_username
  validates :email, uniqueness: { case_sensitive: false }, format: {with: /\A(.+)@(.+)\.(.+)\z/}

  def full_name
    self.first_name + " " + self.last_name
  end

  #Allows users to apply for a specific role
  def apply(role)
    self.applications.build(role_id: role.id, production_id: role.production.id)
    self.save
  end
  
  private
  def set_username
    self.username = self.username || self.first_name.downcase + self.last_name.downcase
  end

  def normalize_names
    self.first_name = self.first_name.downcase.titleize
    self.last_name = self.last_name.downcase.titleize
  end

end

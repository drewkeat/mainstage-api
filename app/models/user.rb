class User < ApplicationRecord
  has_secure_password
  before_save :normalize_names, :set_username
  validates :email, uniqueness: { case_sensitive: false }

  def full_name
    self.first_name + " " + self.last_name
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

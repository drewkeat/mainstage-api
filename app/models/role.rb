class Role < ApplicationRecord
  belongs_to :production
  belongs_to :user, optional: true
  has_many :applications
  has_many :applicants, through: :applications, source: :user
end

class Role < ApplicationRecord
  belongs_to :production
  belongs_to :user, optional: true
  has_many :applications
  has_many :applicants, through: :applications, source: :user
  scope :with_applicants, -> { filter{|role| role.applicants.any?}}
  scope :open, -> { filter{|role| !role.user}}
  scope :filled, -> { filter(&:user)}
  
  def hire(user)
    self.update(user_id: user.id)
  end
  
end

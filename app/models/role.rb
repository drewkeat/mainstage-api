class Role < ApplicationRecord
  belongs_to :production
  belongs_to :user, optional: true
end

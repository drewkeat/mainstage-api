class Application < ApplicationRecord
  belongs_to :user
  belongs_to :production
  belongs_to :role
end

class RoleSerializer
  include JSONAPI::Serializer
  attributes :name, :role_type
  belongs_to :production
  belongs_to :user
  has_many :applicants, serializer: :user
end

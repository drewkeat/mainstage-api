class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :full_name, :first_name, :last_name, :email, :username
  has_many :productions
  has_many :managed_productions, serializer: :production, record_type: :managed_production
  has_many :roles
  has_many :applications
end

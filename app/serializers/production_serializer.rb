class ProductionSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :openings do |production|
    openings = production.roles.open
    RoleSerializer.new(openings)
  end
  has_many :managers, serializer: :user
  has_many :roles
  has_many :company_members, serializer: :user
  has_many :applications
end

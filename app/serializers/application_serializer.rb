class ApplicationSerializer
  include JSONAPI::Serializer
  belongs_to :user
  belongs_to :role
  belongs_to :production
end

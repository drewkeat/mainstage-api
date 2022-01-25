class UserSerializer
  include JSONAPI::Serializer
  attributes :full_name, :first_name, :last_name, :email, :username
  
end

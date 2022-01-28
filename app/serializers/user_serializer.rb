class UserSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :full_name, :first_name, :last_name, :email, :username

  
end

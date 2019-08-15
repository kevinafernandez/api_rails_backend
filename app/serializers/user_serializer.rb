class UserSerializer
  include FastJsonapi::ObjectSerializer
  #attribute :custom_name_attribute, &:attribute

  attributes :name, :description

  has_many :articles
end

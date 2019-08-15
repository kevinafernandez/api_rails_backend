class SectionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :description
  has_many :articles

end

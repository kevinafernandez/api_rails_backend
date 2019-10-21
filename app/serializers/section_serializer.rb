class SectionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :description
  has_many :articles
  #instalar knock, ver video de JWT, hacer login, seguir con la creacion de articulos
  #las secciones solo las crea el admin
end

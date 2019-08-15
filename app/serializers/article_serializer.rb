class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :body

  belongs_to :section
  belongs_to :user

end

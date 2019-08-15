class Article < ApplicationRecord
  belongs_to :section
  belongs_to :user
  validates_presence_of :name, :body
end

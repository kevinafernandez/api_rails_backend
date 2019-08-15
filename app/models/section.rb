class Section < ApplicationRecord
  has_many :articles
  validates :name, uniqueness: { case_sensitive: false }
end

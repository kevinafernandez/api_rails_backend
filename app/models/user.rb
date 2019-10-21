class User < ApplicationRecord
  has_secure_password

  before_save :convert_columns

  has_many :articles
  validates_presence_of :name, :description, :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  def convert_columns
    name.capitalize!
    email.downcase!
  end

end

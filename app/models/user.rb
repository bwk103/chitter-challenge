require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true
  property :email, String, required: true
  property :password_digest, Text, required: true

  validates_uniqueness_of :username, :email

  has n, :peeps

  attr_reader :password
  attr_accessor :confirm_password

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

end

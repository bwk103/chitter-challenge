require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text
  
  has n, :peeps

  attr_reader :password
  attr_accessor :confirm_password

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

end

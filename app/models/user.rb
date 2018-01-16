require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true
  property :email, String, required: true
  property :profile_image_url, Text
  property :password_digest, Text, required: true

  validates_uniqueness_of :username, :email

  has n, :peeps

  attr_reader :password
  attr_accessor :confirm_password

  def self.authenticate(username, password)
    user = User.first(username)
    if user && BCrypt::Password.new(user.password_digest) == password
      return user
    else
      return nil
    end
  end

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

end

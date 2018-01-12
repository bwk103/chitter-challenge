require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time_posted, Time

end

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

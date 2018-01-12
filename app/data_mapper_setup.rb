require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize

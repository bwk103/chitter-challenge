class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time_posted, Time

end

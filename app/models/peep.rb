class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time_posted, Time

  belongs_to :user, required: false

end

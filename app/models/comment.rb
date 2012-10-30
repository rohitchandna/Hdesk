class Comment

  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :body_comments, Text


#belongs_to :ticket
end

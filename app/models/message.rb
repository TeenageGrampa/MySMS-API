class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  field :to, type: String
  field :from, type: String
  belongs_to :user
end

class User < ActiveRecord::Base
  attr_accessible :name
  feed_reader
end

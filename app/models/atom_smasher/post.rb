module AtomSmasher
  class Post < ActiveRecord::Base
    attr_accessible :content, :feed_id, :title
    belongs_to :feed
  end
end

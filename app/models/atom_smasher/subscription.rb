module AtomSmasher
  class Subscription < ActiveRecord::Base
    attr_accessible :feed_id, :reader_id
    belongs_to :feed
    belongs_to :reader, class_name: AtomSmasher.reader_class
  end
end

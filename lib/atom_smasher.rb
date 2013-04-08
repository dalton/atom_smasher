require "atom_smasher/engine"
require "zurb-foundation"
require "simple-rss"
require "ruby-readability"

module AtomSmasher
  mattr_accessor :reader_class
  mattr_accessor :reader_key

  module ActiveRecordExtension
    def feed_reader
      include AtomSmasher::ReaderMethods
    end
  end

  module ReaderMethods
    def self.included(klass)
      klass.class_eval do
        has_many :subscriptions, class_name: "AtomSmasher::Subscription", foreign_key: "reader_id", dependent: :destroy
        has_many :feeds, class_name: "AtomSmasher::Feed", through: :subscriptions
      end
    end
  end
end

ActiveRecord::Base.send(:extend, AtomSmasher::ActiveRecordExtension)
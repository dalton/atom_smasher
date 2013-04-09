require "atom_smasher/engine"
require "zurb-foundation"
require "simple-rss"
require "ruby-readability"

module AtomSmasher
  mattr_accessor :reader_class
  mattr_accessor :reader_mapping


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

  class Engine < Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end

ActiveRecord::Base.send(:extend, AtomSmasher::ActiveRecordExtension)
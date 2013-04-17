module AtomSmasher
  class Feed < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :subscriptions
    attr_accessible :url
    attr_reader :title
    after_find :get_info_from_stream


    def get_info_from_stream
      get_attributes_from_feed
      get_new_posts_from_feed
    end

    private

    def get_attributes_from_feed
      begin
        @rss = ::SimpleRSS.parse(open(url))
        @title = @rss.title
      rescue Exception => e
        Rails.logger.error e
        Rails.logger.error "Could not get posts from feed"
      end

    end

    def get_new_posts_from_feed
      begin
        recent_items = @rss.items
        recent_item = recent_items.shift
        recent_post = posts.where(link: ::URI::encode(recent_item.link.strip)).first
        until recent_post || !recent_item
          post = posts.build
          post.link = ::URI::encode(recent_item.link.strip)
          post.title = recent_item.title
          post.content = recent_item.description

          recent_item = recent_items.shift
          recent_post = posts.where(link: recent_item.link).first if recent_item
        end
        save
      rescue Exception => e
        Rails.logger.error e
        Rails.logger.error "Could not get posts from feed"
      end
    end
  end
end

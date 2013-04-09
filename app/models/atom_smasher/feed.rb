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

    def item_content(item)
      open(::URI::encode(item.link.strip)).read
    end
    private

    def get_attributes_from_feed
      @rss = ::SimpleRSS.parse(open(url))
      @title = @rss.title
    end

    def get_new_posts_from_feed
      recent_items = @rss.items
      recent_item = recent_items.shift
      recent_post = posts.where(link: ::URI::encode(recent_item.link.strip)).first
      until recent_post || !recent_item
        post = posts.build
        post.link = ::URI::encode(recent_item.link.strip)
        post.title = recent_item.title
        source = item_content(recent_item)
        post.content = ::Readability::Document.new(source, tags: %w[], attributes: %w[]).content
        recent_item = recent_items.shift
        recent_post = posts.where(link: recent_item.link).first if recent_item
      end
      save
    end
  end
end

module AtomSmasher
  class Feed < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    attr_accessible :url
    attr_reader :title
    after_find :get_info_from_stream


    private
    def get_info_from_stream
      get_attributes_from_feed
      get_new_posts_from_feed
    end

    def get_attributes_from_feed
      @rss = SimpleRSS.parse(open(url))
      @title = @rss.title
    end

    def get_new_posts_from_feed
      recent_items = @rss.items
      recent_item = recent_items.shift
      recent_post = posts.where(link: URI::encode(recent_item.link.strip)).first
      until recent_post || !recent_item
        post = posts.build
        post.link = URI::encode(recent_item.link.strip)
        post.title = recent_item.title
        source = open(URI::encode(recent_item.link.strip)).read
        post.content = Readability::Document.new(source, tags: %w[], attributes: %w[]).content
        recent_item = recent_items.shift
        recent_post = posts.where(link: recent_item.link).first if recent_item
      end
      save
    end
  end
end

require 'spec_helper'
describe AtomSmasher::Feed do
  AtomSmasher::Feed.create(url: "#{File.dirname(__FILE__)}/../fixtures/previous_episodes.xml")
  it "should be have all episodes" do
    feed = AtomSmasher::Feed.last
    feed.should have(9).posts
  end

  it "should get the title from the feed" do
    feed = AtomSmasher::Feed.last
    feed.title.should == "ASCIIcasts - Latest Episodes"
  end

  it "should update if a new item is posted" do
    feed = AtomSmasher::Feed.last
    feed.url =  "#{File.dirname(__FILE__)}/../fixtures/current_episodes.xml"
    feed.save
    feed = AtomSmasher::Feed.last
    feed.should have(10).posts
    feed.posts.last.title.should == "Importing CSV and Excel"
  end
end
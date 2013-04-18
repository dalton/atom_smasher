require 'spec_helper'
describe AtomSmasher::Feed do
  AtomSmasher::Feed.create(url: "#{File.dirname(__FILE__)}/../fixtures/previous_episodes.xml")
  
  subject(:feed) { AtomSmasher::Feed.last }
  it { should have(9).posts }
  its(:title) { should == "ASCIIcasts - Previous Episodes" }

  it "should update if a new item is posted" do
    feed.url =  "#{File.dirname(__FILE__)}/../fixtures/current_episodes.xml"
    feed.save
    feed = AtomSmasher::Feed.last
    feed.should have(10).posts
    feed.posts.last.title.should == "Importing CSV and Excel"
  end
end

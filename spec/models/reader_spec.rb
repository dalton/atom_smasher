require 'spec_helper'
describe User do
  reader = User.create(name: "Atom Smasher")
  feed = AtomSmasher::Feed.create(url: "#{File.dirname(__FILE__)}/../fixtures/previous_episodes.xml")
  reader.feeds << feed

  it "should subscribe to feeds" do
    reader.should have(1).feeds
  end
end
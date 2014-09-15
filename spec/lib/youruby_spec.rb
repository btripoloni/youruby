require "spec_helper"
require "youruby"

describe Youruby do
  it "get video name" do
    video = Youruby::Youtube.new('uaEJvYWc2ag')
    video.id.should == "uaEJvYWc2ag"
  end
  it "get video id" do
    video = Youruby::Youtube.new('uaEJvYWc2ag')
    video.id.should == "uaEJvYWc2ag"
  end
  it "get video url" do
    video = Youruby::Youtube.new('uaEJvYWc2ag')
    url = video.get_url
    url.should == "http://youtube.com/watch?v=uaEJvYWc2ag"
  end
  it "get video"
end
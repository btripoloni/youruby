require "spec_helper"
require "fakefs/spec_helpers"
require "youruby"

describe Youruby do
  include FakeFS::SpecHelpers
  let(:video) {Youruby::Youtube.new('uaEJvYWc2ag')}
  context 'Youtube'do
    describe 'get' do
      it ".title" do
        expect(video.title).to eq("FFmpeg-slowmotion.1")
      end

      it ".id" do
        expect(video.id).to eq("uaEJvYWc2ag")
      end

      it ".url" do
        expect(video.url).to eq("http://youtube.com/watch?v=uaEJvYWc2ag")
      end

      it '.thumbnails' do
        expect(video.thumbnails['quality']['default']).to eq("http://img.youtube.com/vi/uaEJvYWc2ag/default.jpg")
      end

      it '.file_path' do
        expect(video.file_path).to eq("temp/download/FFmpeg-slowmotion.1-uaEJvYWc2ag.mp4")
      end
    end

    describe 'download' do
      it ".download_video" do
        FakeFS do
          video.download_video
          File.exists? "#{video.get_title}-#{video.get_id}.mp4"
        end
      end

      it ".download_preview"
    end

    describe 'set' do
      it '.url' do
        expect(video.url("https://www.youtube.com/watch?v=lIzAlULvipk")).to eq(true)
      end

      it "path" do
        expect(video.path("/local/")).to eq(true)
      end
    end
  end

end

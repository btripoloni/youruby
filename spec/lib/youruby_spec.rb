require 'spec_helper'
require 'fakefs/spec_helpers'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'youruby'



describe Youruby do
  include FakeFS::SpecHelpers
  let(:video) { Youruby::Youtube.new('uaEJvYWc2ag') }
  context 'Youtube'do
    describe 'get' do
      it '.title' do
        expect(video.title).to eq('FFmpeg-slowmotion.1')
      end

      it '.id' do
        expect(video.id).to eq('uaEJvYWc2ag')
      end

      it '.url' do
        expect(video.url).to eq('http://youtube.com/watch?v=uaEJvYWc2ag')
      end

      it '.thumbnail' do
        url = 'http://img.youtube.com/vi/uaEJvYWc2ag/default.jpg'
        thumbnail = video.thumbnail('default')
        expect(thumbnail).to eq(url)
      end

      it '.file_path' do
        path = 'temp/download/FFmpeg-slowmotion.1-uaEJvYWc2ag.mp4'
        expect(video.file_path).to eq(path)
      end
    end

    describe 'download' do
      it '.download_video' do
        FakeFS do
          video.download_video
          File.exist? '#{video.get_title}-#{video.get_id}.mp4'
        end
      end

      it '.download_preview'
    end

    describe 'set' do
      it '.url' do
        url = 'https://www.youtube.com/watch?v=lIzAlULvipk'
        expect(video.url(url)).to eq(true)
      end

      it 'path' do
        expect(video.path('/local/')).to eq(true)
      end
    end
  end
end

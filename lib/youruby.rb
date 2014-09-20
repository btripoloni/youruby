require 'youruby/version'
require 'uri'
require 'cgi'

# the Youruby is a base of this gem
#
module Youruby
  # Youtube Class
  #
  # @example
  #   Youruby::Youtube.new(id)
  #
  # @param id [String] the id of a video from Youtube
  #
  class Youtube
    attr_reader :id, :location
    root_path = File.expand_path(File.dirname(__FILE__))
    yt_path = '../bin/youtube-dl'
    YT_DL = File.join(root_path, yt_path)

    def initialize(id)
      @id = id
      @location = 'temp/download'
    end

    def title
      title = `#{YT_DL} --get-title #{url}`
      title.delete("\n")
    end

    def file_path
      File.join(@location, "#{title}-#{id}.mp4")
    end

    def url(url = nil)
      if url
        url = URI.parse url

        url_parse = params(url.query)

        @id = url_parse['v'].first

        true
      else
        "http://youtube.com/watch?v=#{@id}"
      end
    end

    def thumbnail(path)
      "http://img.youtube.com/vi/#{@id}/#{path}.jpg"
    end

    def path(path)
      @location = path
      true
    end

    def download_video
      system(YT_DL, '-o', file_path, url, '--no-progress')
    end

    private

    def params(body)
      CGI.parse(body)
    end
  end
end

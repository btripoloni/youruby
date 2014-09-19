require "youruby/version"
require "uri"
require "cgi"

module Youruby
  class Youtube
    attr_reader :id

    YT_DL = File.join(File.expand_path(File.dirname(__FILE__)), "../bin/youtube-dl")

    def initialize(id)
      @id = id
      @location = "temp/download"
      @thumbnails
    end

    def title
      title = `#{YT_DL} --get-title #{get_url}`
      title.delete("\n")
    end

    def url
      "http://youtube.com/watch?v=#{@id}"
    end

    def file_path
      File.join(@location, "#{get_title}-#{get_id}.mp4")
    end

    def url(url)
      url = URI.parse url
      url_parse = params(url.query)
      id(url_parse['v'].first)
    end

    def path(path)
      @location = path
      true
    end

    def download_video
      system(YT_DL, '-o', file_path, get_url, '--no-progress')
    end

    private

    def id(id)
      @id = id
      true
    end

    def params(body)
      CGI.parse(body)
    end

    def thumbnail_url(path)
      "http://img.youtube.com/vi/#{@id}/#{path}.jpg"
    end

    def thumbnails
      thumbnails = Hash.new

      frame = 0
      frames = Hash.new
      while frame < 3
        frames < {frame => thumbnail_url(frame)}
      end

      quality = ['', 'hq', 'mq', 'sd', 'maxres']
      qualities = Hash.new
      count = 0
      while count < quality.lenght
        description = "#{quality[count]}default"
        qualities < {description => thumbnail_url(description)}
      end

      thumbnails < frames < qualities

      #{
      #  "frames" => {
      #    0 => thumbnail_url("0"),
      #    1 => thumbnail_url("1"),
      #    2 => thumbnail_url("2"),
      #    3 => thumbnail_url("3")
      #  },
      #  "quality" => {
      #    "default" => thumbnail_url("default"),
      #    "hqdefault" => thumbnail_url("hqdefault"),
      #    "mqdefault" => thumbnail_url("mqdefault"),
      #    "sddefault" => thumbnail_url("sddefault"),
      #    "maxresdefault" => thumbnail_url("maxresdefault")
      #  }
      #}
    end
  end
end

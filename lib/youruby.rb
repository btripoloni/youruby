require "youruby/version"
require "uri"
require "cgi"

module Youruby
  class Youtube
    YT_DL = File.join(File.expand_path(File.dirname(__FILE__)), "../bin/youtube-dl")
    def initialize(id)
      @id = id
      @location = "temp/download"
    end

    def get_title
      title = `#{YT_DL} --get-title #{get_url}`
      title.delete("\n")
    end

    def get_id
      @id
    end

    def get_url
      "http://youtube.com/watch?v=#{@id}"
    end

    def file_path
      File.join(@location, "#{get_title}-#{get_id}.mp4")
    end

    def get_thumbnails
      {
        "frames" => {
          0 => thumbnail_url("0"),
          1 => thumbnail_url("1"),
          2 => thumbnail_url("2"),
          3 => thumbnail_url("3")
         },
        "quality" => {
          "default" => thumbnail_url("default"),
          "hqdefault" => thumbnail_url("hqdefault"),
          "mqdefault" => thumbnail_url("mqdefault"),
          "sddefault" => thumbnail_url("sddefault"),
          "maxresdefault" => thumbnail_url("maxresdefault")
        }
      }
    end

    def set_url(url)
      url = URI.parse url
      url_parse = CGI.parse(url.query)
      true if @id = url_parse['v'].first

    end

    def set_path(path)
      true if @location = path
    end

    def download_video
      system(YT_DL, '-o', file_path, get_url, '--no-progress')
    end

    private
    def thumbnail_url(path)
      "http://img.youtube.com/vi/#{@id}/#{path}.jpg"
    end
  end
end
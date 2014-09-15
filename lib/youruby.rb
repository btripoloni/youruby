require "youruby/version"

module Youruby
  class Youtube
    attr_accessor :id
    def initialize(id)
      @id = id
    end

    def get_url
      "http://youtube.com/watch?v=#{@id}"
    end

  end
end

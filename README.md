# Youruby [![Inline docs](http://inch-ci.org/github/btripoloni/youruby.svg?branch=master)](http://inch-ci.org/github/btripoloni/youruby)

Make donwloads of videos form Youtube using ruby

## Installation

Add this line to your application's Gemfile:

    gem 'youruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youruby

## Usage

    video_id = "xJkVQa_PMTY"
    video = Youruby::Youtube.new(video_id)
    video.get_video #make download of video.

    Other methods
    video.get_title
    video.get_id
    video.get_url
    video.get_thumbnail #returns a hash

    video.set_url("https://www.youtube.com/watch?v=UwPWLCVekGc") #set the id using the url of video.
    video.set_path("make/downloads/here") #set the location of the video is downloaded




## Contributing

1. Fork it ( https://github.com/btripoloni/youruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

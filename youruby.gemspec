# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'youruby'
  spec.version       = Youruby::VERSION
  spec.authors       = ['Bruno Tripoloni']
  spec.email         = ['bruno.tripoloni@gmail.com']
  spec.summary       = %q{Make downloads of video from Youtube.}
  spec.description   = %q{Make downloads of video from Youtube}
  spec.homepage      = 'http://github.com/btripoloni/youruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fakefs'
end

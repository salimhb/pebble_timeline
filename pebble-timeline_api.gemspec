# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pebble/timeline_api/version'

Gem::Specification.new do |spec|
  spec.name          = "pebble-timeline_api"
  spec.version       = Pebble::TimelineApi::VERSION
  spec.authors       = ["Salim Hbeiliny"]
  spec.email         = ["salim@hbeiliny.com"]
  spec.summary       = %q{A wrapper for the Pebble Timeline API}
  spec.description   = %q{This is a wrapper for the Pebble Timeline API documented here: http://developer.getpebble.com/guides/timeline/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'pry'
end

# PebbleTimeline

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pebble_timeline'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pebble_timeline

## Usage

```
require 'pebble_timeline'

api = PebbleTimeline::API.new(ENV['PEBBLE_TIMELINE_API_KEY'])
pins = PebbleTimeline::Pins.new(api)

pins.create(id: "test-1", topics: 'test', time: "2015-06-10T08:01:10.229Z", layout: { shortTitle: 'test 1' })

pins.delete("test-1")
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pebble_timeline/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

require 'active_support/configurable'
require 'active_support/inflector'
require 'faraday'
require 'json'
require 'roar/decorator'
require 'roar/json'

require "pebble_timeline/version"
require 'pebble_timeline/errors'

require 'pebble_timeline/middleware/error_detector'

require 'pebble_timeline/representer/action'
require 'pebble_timeline/representer/reminder'
require 'pebble_timeline/representer/layout'
require 'pebble_timeline/representer/notification'
require 'pebble_timeline/representer/pin'

require 'pebble_timeline/pins'
require 'pebble_timeline/api'

module PebbleTimeline
  include ActiveSupport::Configurable

  config_accessor(:api_key)
  config_accessor(:base_url) { 'https://timeline-api.getpebble.com/v1/' }
end

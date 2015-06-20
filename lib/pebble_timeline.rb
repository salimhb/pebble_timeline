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
require 'pebble_timeline/subscriptions'
require 'pebble_timeline/api'

module PebbleTimeline

  class Config
    attr_accessor :api_key, :base_url
  end

  def self.config
    @config ||= Config.new.tap do |c|
      c.base_url = 'https://timeline-api.getpebble.com/v1/'
    end
  end

end

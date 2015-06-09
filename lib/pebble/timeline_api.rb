require 'active_support/configurable'
require 'active_support/inflector'
require 'faraday'
require 'json'
require 'roar/decorator'
require 'roar/json'

require 'pebble/timeline_api/version'
require 'pebble/timeline_api/errors'

require 'pebble/timeline_api/middleware/error_detector'

require 'pebble/timeline_api/representer/action'
require 'pebble/timeline_api/representer/reminder'
require 'pebble/timeline_api/representer/layout'
require 'pebble/timeline_api/representer/notification'
require 'pebble/timeline_api/representer/pin'

require 'pebble/timeline_api/pins'

module Pebble
  class TimelineAPI
    include ActiveSupport::Configurable

    config_accessor(:api_key)
    config_accessor(:base_url) { 'https://timeline-api.getpebble.com/v1/' }

    def initialize(api_key = nil)
      raise ConfigMissingAPIKeyError, 'You must provide an API Key' unless Pebble::TimelineAPI.config.api_key || api_key

      @api_key = Pebble::TimelineAPI.config.api_key || api_key
      @base_url = Pebble::TimelineAPI.config.base_url
    end

    def call(url, http_method, params={})
      response = send(http_method, url, params)
      response.body
    end

    def connection
      @connection ||= Faraday.new(url: @api_url) do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['X-API-Key'] = @api_key
        faraday.adapter Faraday.default_adapter
        faraday.use Pebble::TimelineAPI::Middleware::ErrorDetector
      end
    end

    private

      def post(path, params)
        connection.post do |req|
          req.url resource_url(path)
          req.headers['X-User-Token'] = params.delete(:user_token) if params.has_key? :user_token
          req.headers['X-Pin-Topics'] = params.delete(:topics) if params.has_key? :topics
          req.body = params.to_json
        end
      end

      def put(path, params)
        connection.put do |req|
          req.url resource_url(path)
          req.headers['X-User-Token'] = params.delete(:user_token) if params.has_key? :user_token
          req.headers['X-Pin-Topics'] = params.delete(:topics) if params.has_key? :topics
          req.body = params.to_json
        end
      end

      def get(path, params)
        connection.get(resource_url(path), params)
      end

      def delete(path, params)
        connection.delete(resource_url(path), params)
      end

      def resource_url(path)
        "#{@base_url}#{path}"
      end

  end
end

module PebbleTimeline
  class API
    def initialize
      raise ConfigMissingAPIKeyError, 'You must provide an API Key' unless PebbleTimeline.config.api_key

      @api_key = PebbleTimeline.config.api_key
      @base_url = PebbleTimeline.config.base_url
    end

    def self.call(url, http_method, params={})
      @api ||= self.new
      response = @api.send(http_method, url, params)
      response.body
    end

    private

      def connection
        @connection ||= Faraday.new(url: @api_url) do |faraday|
          faraday.headers['Content-Type'] = 'application/json'
          faraday.headers['X-API-Key'] = @api_key
          faraday.adapter Faraday.default_adapter
          faraday.use PebbleTimeline::Middleware::ErrorDetector
        end
      end

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
        connection.get do |req|
          req.url resource_url(path)
          req.headers['X-User-Token'] = params.delete(:user_token) if params.has_key? :user_token
        end
      end

      def delete(path, params)
        connection.delete do |req|
          req.url resource_url(path)
          req.headers['X-User-Token'] = params.delete(:user_token) if params.has_key? :user_token
        end
      end

      def resource_url(path)
        "#{@base_url}#{path}"
      end

  end
end

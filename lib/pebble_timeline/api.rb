module PebbleTimeline
  class API
    def initialize(api_key = nil)
      raise ConfigMissingAPIKeyError, 'You must provide an API Key' unless PebbleTimeline.config.api_key || api_key

      @api_key = PebbleTimeline.config.api_key || api_key
      @base_url = PebbleTimeline.config.base_url
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
        faraday.use PebbleTimeline::Middleware::ErrorDetector
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

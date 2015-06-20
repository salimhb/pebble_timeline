module PebbleTimeline
  module Middleware
    class ErrorDetector < Faraday::Middleware

      def call(env)
        @app.call(env).on_complete do |env|
          unless (200..299).include? env[:status]
            error = APIError.new env[:body]

            begin
              response = JSON.load env[:body]
              error = APIError.new response['errorMessage']
              error.code = response['errorCode']
            ensure
              raise error
            end
          end
        end
      end

    end
  end
end

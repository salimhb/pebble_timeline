module PebbleTimeline
  class Subscriptions
    def self.get(user_token)
      JSON.load API.call("user/subscriptions", :get, { user_token: user_token })
    end
  end
end

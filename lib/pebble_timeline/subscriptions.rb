module PebbleTimeline
  class Subscriptions
    def initialize(master)
      @master = master
    end

    def get(user_token)
      JSON.load @master.call("user/subscriptions", :get, { user_token: user_token })
    end
  end
end

module PebbleTimeline

  class APIError < StandardError
    attr_accessor :code
  end

  class ConfigError < StandardError
  end

  class ConfigMissingAPIKeyError < ConfigError
  end

end

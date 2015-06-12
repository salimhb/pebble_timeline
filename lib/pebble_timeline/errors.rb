module PebbleTimeline

  class APIError < StandardError
  end

  class ConfigError < StandardError
  end

  class ConfigMissingAPIKeyError < ConfigError
  end

end

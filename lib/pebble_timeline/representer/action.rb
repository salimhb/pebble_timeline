module PebbleTimeline
  class Action < OpenStruct
  end

  module Representer
    class ActionRepresenter < Roar::Decorator
      include Roar::JSON

      property :title
      property :type
      property :launchCode
    end
  end
end

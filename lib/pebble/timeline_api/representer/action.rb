module Pebble
  class TimelineAPI
    class Action < OpenStruct
    end

    module Representer
      class ActionRepresenter < Roar::Decorator
        include Roar::JSON

        property :title
        property :type
      end
    end
  end
end

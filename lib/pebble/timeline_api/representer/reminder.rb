module Pebble
  class TimelineAPI
    class Reminder < OpenStruct
    end

    module Representer
      class ReminderRepresenter < Roar::Decorator
        include Roar::JSON

        property :time
        property :layout
      end
    end
  end
end

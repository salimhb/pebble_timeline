module PebbleTimeline
  class Notification < OpenStruct
  end

  module Representer
    class NotificationRepresenter < Roar::Decorator
      include Roar::JSON

      property :layout, extend: LayoutRepresenter, class: Layout
      property :time
    end
  end
end

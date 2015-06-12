module PebbleTimeline
  class Pin < OpenStruct
  end

  module Representer
    class PinRepresenter < Roar::Decorator
      include Roar::JSON

      property :id
      property :time
      property :duration
      property :createNotification, extend: NotificationRepresenter, class: Notification
      property :updateNotification, extend: NotificationRepresenter, class: Notification
      property :layout,             extend: LayoutRepresenter,       class: Layout

      collection :reminders, extend: ReminderRepresenter, class: Reminder
      collection :actions,   extend: ActionRepresenter,   class: Action
    end
  end
end

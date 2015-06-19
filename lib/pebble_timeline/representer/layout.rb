module PebbleTimeline
  class Layout < OpenStruct
  end

  module Representer
    class LayoutRepresenter < Roar::Decorator
      include Roar::JSON

      # The type field is always required to determine the type of layout being displayed.
      property :type
      property :title
      property :shortTitle
      property :subtitle
      property :body
      property :tinyIcon
      property :smallIcon
      property :largeIcon

      # The following attributes are also available for all pin layout types (excluding notifications and reminders).
      property :primaryColor
      property :secondaryColor
      property :backgroundColor
      property :headings
      property :paragraphs
      property :lastUpdated

      # Calendar Layout & Weather Layout & Generic Reminder
      property :locationName

      # Sports Layout
      property :rankAway
      property :rankHome
      property :nameAway
      property :nameHome
      property :recordAway
      property :recordHome
      property :scoreAway
      property :scoreHome
      property :sportsGameState
    end
  end
end

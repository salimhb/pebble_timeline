module PebbleTimeline
  class Layout < OpenStruct
  end

  module Representer
    class LayoutRepresenter < Roar::Decorator
      include Roar::JSON

      property :type
      property :title
      property :shortTitle
      property :subtitle
      property :body
      property :tinyIcon
      property :smallIcon
      property :largeIcon
    end
  end
end

module Pebble
  class TimelineAPI
    class Pins
      def initialize(master, type = 'shared')
        @master = master
        @type = type
      end

      def create(params = {})
        @master.call("#{@type}/pins/#{params[:id]}", :put, params)
      end

      def update(id, params = {})
        @master.call("#{@type}/pins/#{id}.json", :put, params)
      end

      def delete(id)
        @master.call("#{@type}/pins/#{id}", :delete)
      end
    end
  end
end

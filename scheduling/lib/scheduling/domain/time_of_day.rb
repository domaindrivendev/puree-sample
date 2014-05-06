require 'puree'

module Scheduling
  module Domain
  
    class TimeOfDay
      attr_reader :ticks
  
      def initialize(hour, minute)
        raise ArgumentError.new('hour required') if hour.nil?
        raise ArgumentError.new('minute required') if minute.nil?

        @ticks = ((hour * 60) + minute) * 60
      end

      def hour
        @ticks/60
      end

      def minute
        @ticks%60
      end

      def later_than?(other)
        @ticks > other.ticks
      end

      def between?(min, max)
        @ticks >= min.ticks and @ticks <= max.ticks
      end

      def to_s
        "%02d:%02d" % [hour, minute]
      end

      def ==(other)
        self.class == other.class && @ticks == other.ticks
      end
      
      alias :eql? :==
  
      def hash
        @ticks.hash
      end
    end
  
  end
end

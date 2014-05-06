require 'puree'

module Scheduling
  module Domain
  
    class Session
      attr_reader :topic_id, :start_time, :end_time
  
      def initialize(topic_id, start_time, end_time)
        raise ArgumentError.new('topic_id required') if topic_id.nil?
        raise ArgumentError.new('start_time required') if start_time.nil?
        raise ArgumentError.new('end_time required') if end_time.nil?
  
        raise InvalidSessionTime if start_time.later_than?(end_time)

        @topic_id = topic_id
        @start_time = start_time
        @end_time = end_time
      end
  
      def conflicts_with?(other)
        start_time.between?(other.start_time, other.end_time) \
        or end_time.between?(other.start_time, other.end_time)
      end

      def ==(other)
        self.class == other.class &&
        @topic_id == other.topic_id &&
        @start_time == other.start_time &&
        @end_time == other.end_time
      end
      
      alias :eql? :==
  
      def hash
        [@topic_id, @start_time, @end_time].hash
      end
    end

    class InvalidSessionTime < StandardError
    end
  
  end
end

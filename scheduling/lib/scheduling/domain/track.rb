require 'puree'

module Scheduling
  module Domain
  
    class Track < Puree::EventSource
      identifier :id
      attr_reader :name
  
      def initialize(id, name, conference)
        raise ArgumentError.new('id required') if id.nil?
        raise ArgumentError.new('name required') if name.nil?
        raise ArgumentError.new('conference required') if conference.nil?
  
        signal_event :track_created,
          id: id, name: name, conference_id: conference.id
      end
  
      apply_event :track_created do |args|
        @id = args[:id]
        @name = args[:name]
      end

      def add_session(start_time, end_time, topic)
        raise ArgumentError.new('start_time') if start_time.nil?
        raise ArgumentError.new('end_time') if end_time.nil?

        raise InvalidSessionTime unless start_time.before?(end_time)

        raise TopicNotShortlisted unless topic.shortlisted?     

        signal_event :track_session_added,
          track_id: id,
          start_time: start_time,
          end_time: end_time,
          topic_id: topic.id,
          topic_title: topic.title
      end

      apply_event :track_session_added do |args|
      end
    end
  
    class InvalidSessionTime < StandardError
    end

    class TopicNotShortlisted < StandardError
    end

  end
end

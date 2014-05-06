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
        @sessions = []
      end

      def add_session(topic, start_time, end_time)
        raise ArgumentError.new('topic required') if topic.nil?
        raise ArgumentError.new('start_time required') if start_time.nil?
        raise ArgumentError.new('end_time required') if end_time.nil?

        raise TopicNotShortlisted unless topic.shortlisted?

        new_session = Session.new(topic.id, start_time, end_time)
        @sessions.each do |session|
          raise ConflictingSessionTime if new_session.conflicts_with?(session)
        end

        signal_event :track_session_added,
          track_id: id, session: new_session
      end

      apply_event :track_session_added do |args|
        @sessions << args[:session]
      end
    end

    class TopicNotShortlisted < StandardError
    end

    class ConflictingSessionTime < StandardError
    end

  end
end

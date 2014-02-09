require 'puree'

module Scheduling
  module Domain
  
    class Topic < Puree::EventSource
      identifier :id
      attr_reader :title, :overview, :conference_id
  
      def initialize(id, speaker, title, overview, conference)
        raise ArgumentError.new('id required') if id.nil?
        raise ArgumentError.new('speaker required') if speaker.nil?
        raise ArgumentError.new('title required') if title.nil?
        raise ArgumentError.new('overview required') if overview.nil?
        raise ArgumentError.new('conference required') if conference.nil?

        raise ConferenceNotAcceptingSubmissions unless conference.accepting_submissions?

        signal_event :topic_submitted,
          topic_id: id,
          speaker: speaker,
          title: title,
          overview: overview,
          conference_id: conference.id
      end

      apply_event :topic_submitted do |args|
        @id = args[:topic_id]
        @speaker = args[:speaker]
        @title = args[:title]
        @overview = args[:overview]
        @conference_id = args[:conference_id]
        @status = :pending
      end

      def shortlist
        signal_event :topic_shortlisted, topic_id: @id
      end

      apply_event :topic_shortlisted do |args|
        @status = :shortlisted
      end

      def unshortlist
        signal_event :topic_unshortlisted, topic_id: @id
      end

      apply_event :topic_unshortlisted do |args|
        @status = :pending
      end

      def shortlisted?
        @status == :shortlisted
      end
    end
  
    class ConferenceNotAcceptingSubmissions < StandardError
    end

  end
end

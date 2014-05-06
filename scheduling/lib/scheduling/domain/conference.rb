require 'puree'

module Scheduling
  module Domain
  
    class Conference < Puree::EventSource
      identifier :id
      attr_reader :organizer, :name, :description, :date, :location
  
      def initialize(id, organizer, name, description, date, location)
        raise ArgumentError.new('id required') if id.nil?
        raise ArgumentError.new('organizer required') if organizer.nil?
        raise ArgumentError.new('name required') if name.nil?
        raise ArgumentError.new('description required') if description.nil?
        raise ArgumentError.new('date required') if date.nil?
        raise ArgumentError.new('date too_soon') if too_soon?(date)
        raise ArgumentError.new('location required') if location.nil?
  
        signal_event :conference_created,
          id: id,
          organizer: organizer,
          name: name,
          description: description,
          date: date,
          location: location,
          status: :draft
      end

      apply_event :conference_created do |args|
        @id = args[:id]
        @organizer = args[:organizer]
        @name = args[:name]
        @description = args[:description]
        @status = args[:status]
        @sessions = []
      end

      def call_for_submissions
        signal_event :called_for_submissions, conference_id: @id
      end

      apply_event :called_for_submissions do |args|
        @status = :accepting_submissions
      end

      def accepting_submissions?
        @status == :accepting_submissions
      end

      private

      def too_soon?(date)
        tommorrow = Time.now.utc + (60 * 60 * 24)
        midnight = Time.utc(tommorrow.year, tommorrow.month, tommorrow.day)
        date < midnight
      end
    end
  
  end
end
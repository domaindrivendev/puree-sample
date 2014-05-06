require 'puree'

module Planning
  module Domain
  
    class Submission < Puree::EventSource
      identifier :id
  
      def initialize(id, title, overview, speaker, conference)
        raise ArgumentError.new('id required') if id.nil?
        raise ArgumentError.new('title required') if title.nil?
        raise ArgumentError.new('overview required') if overview.nil?
        raise ArgumentError.new('speaker required') if speaker.nil?
        raise ArgumentError.new('conference required') if conference.nil?
  
        signal_event :submission_created,
          id: id,
          title: title,
          overview: overview,
          conference_id: conference.id
      end
  
      apply_event :submission_created do |args|
        @id = args[:id]
        @status = :pending
      end 

      def shortlist
        signal_event :submission_shortlisted, submission_id: @id
      end

      apply_event :submission_shortlisted do |args|
        @status = :shortlisted
      end

      def unshortlist
        signal_event :submission_unshortlisted, submission_id: @id
      end

      apply_event :submission_unshortlisted do |args|
        @status = :pending
      end

      def shortlisted?
        @status == :shortlisted
      end
    end
  
  end
end

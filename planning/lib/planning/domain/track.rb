require 'puree'

module Planning
  module Domain
  
    class Track < Puree::EventSource
      identifier :id
  
      def initialize(id, name, conference)
        raise ArgumentError.new('id required') if id.nil?
        raise ArgumentError.new('name required') if name.nil?
        raise ArgumentError.new('conference required') if conference.nil?
  
        signal_event :track_created,
          id: id,
          name: name,
          conference_id: conference.id
      end
  
      apply_event :track_created do |args|
        @id = args[:id]
        @conference_id = args[:conference_id]
      end 
    end
  
  end
end

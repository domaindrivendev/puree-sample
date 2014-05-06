require 'puree'

module Planning
  module Domain
  
    class Conference < Puree::EventSource
      identifier :id
  
      def initialize(id, name, description, date, location, organizer)
        raise ArgumentError.new('id required') if id.nil?
        raise ArgumentError.new('name required') if name.nil?
        raise ArgumentError.new('description required') if description.nil?
        raise ArgumentError.new('date required') if date.nil?
        raise ArgumentError.new('location required') if location.nil?
        raise ArgumentError.new('organizer required') if organizer.nil?
  
        signal_event :conference_created,
          id: id,
          name: name,
          description: description,
          date: date,
          location: location,
          organizer_id: organizer.user_id,
          organizer_name: organizer.name
      end
  
      apply_event :conference_created do |args|
        @id = args[:id]
        @status = :draft
      end 
    end
  
  end
end
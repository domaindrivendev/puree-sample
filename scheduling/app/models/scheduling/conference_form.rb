module Scheduling

  class ConferenceForm < PersistentForm
    attr_accessible :id, :name, :description, :date, :location

    def on_submit
      organizer = Domain::Organizer.new(123, 'Joe Organizer')

      conference = Domain::Conference.new(
        conference_repository.next_id,
        organizer,
        name,
        description,
        date.to_time,
        location
      )
      conference_repository.add(conference)
    end
  end

end
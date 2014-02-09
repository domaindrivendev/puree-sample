module Scheduling
  class CreateConference < Command
    field :name, :string
    field :description, :text
    field :date, :date
    field :location, :string
  
    attr_accessible :name, :description, :date, :location

    def do_submit
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

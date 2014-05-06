module Planning
  
  class NewConferenceForm < TransientForm
    field :name, :string
    field :description, :string
    field :date, :date
    field :location, :string
  
    attr_accessible :name, :description, :date, :location
  
    def on_submit
      organizer = Domain::Organizer.new(123, 'Joe Organizer')

      conference = Domain::Conference.new(
        conference_repository.next_id,
        name,
        description,
        date,
        location,
        organizer
      )

      conference_repository.add(conference)
    end
  end
  
end

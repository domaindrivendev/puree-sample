module Planning
  
  class NewTrackForm < TransientForm
    field :name, :string
    field :conference_id, :integer
  
    attr_accessible :name, :conference_id
  
    def self.for(conference_id)
      new(conference_id: conference_id)
    end

    def on_submit
      conference = conference_repository.find_by(conference_id)

      track = Domain::Track.new(
        track_repository.next_id,
        name,
        conference
      )
      
      track_repository.add(track)
    end
  end
  
end

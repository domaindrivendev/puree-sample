module Scheduling
  class CreateTrack < Command
    field :name, :string
    field :conference_id, :integer

    attr_accessible :name, :conference_id
  
    def do_submit
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

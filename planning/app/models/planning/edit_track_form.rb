module Planning
  
  class EditTrackForm < TransientForm
    attr_accessor :conference_id
    field :track_id, :integer
    field :name, :string
    attr_accessor :sessions

    attr_accessible :conference_id, :track_id, :name, :sessions
  
    def self.for(track_id)
      track = Planning::Track.find(track_id)
      sessions = track.sessions.map { |s| s.attributes }
      new(conference_id: track.conference_id, track_id: track_id, name: track.name, sessions: sessions)
    end

    def on_submit
    end
  end
  
end

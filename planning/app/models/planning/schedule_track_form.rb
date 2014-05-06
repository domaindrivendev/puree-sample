module Planning
  
  class ScheduleTrackForm < TransientForm
    field :track_id, :integer
  
    attr_accessible :track_id, :sessions
  
    def self.for(track_id)
      track = Track.find(track_id)

      new(track_id: track.id, sessions: track.sessions.map {|s| s.atributes})
    end

    def sessions=(sessions_attributes)
    end

    def on_submit
  
      # Call into domain model here ...
    end
  end
  
end

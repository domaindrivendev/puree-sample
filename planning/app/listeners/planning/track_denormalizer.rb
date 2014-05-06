module Planning
  
  class TrackDenormalizer < Puree::EventListener
    on_event :track_created do |args|
      Track.create(
        id: args[:id],
        name: args[:name],
        conference_id: args[:conference_id]
      )
    end
  end
  
end

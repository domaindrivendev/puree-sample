module Scheduling

  class TrackDenormalizer < Puree::EventListener
    on_event :track_created do |args|
      Track.create(
        id: args[:id],
        name: args[:name],
        conference_id: args[:conference_id]
      )
    end

    on_event :track_session_added do |args|
      track = Track.find(args[:track_id])
      session = args[:session]

      track.sessions.create(
        time_slot: "#{session.start_time} - #{session.end_time}",
        title: session.topic_id
      )
    end
  end

end
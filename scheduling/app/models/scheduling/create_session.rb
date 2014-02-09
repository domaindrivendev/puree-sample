module Scheduling
  class CreateSession < Command
    field :start_time_hours, :integer
    field :start_time_mins, :integer
    field :end_time_hours, :integer
    field :end_time_mins, :integer
    field :topic_id, :integer
    field :track_id, :integer
  
    attr_accessible :start_time_hours,
                    :start_time_mins,
                    :end_time_hours,
                    :end_time_mins,
                    :topic_id,
                    :track_id
  
    def do_submit
      track = track_repository.find_by(track_id)

      start_time = Domain::TimeOfDay.new(start_time_mins, start_time_hours)
      end_time = Domain::TimeOfDay.new(end_time_mins, end_time_hours)
      topic = topic_repository.find_by(topic_id)

      track.add_session(start_time, end_time, topic)

      track_repository.update(track)
    end

    def topics
      track = Scheduling::Track.find(track_id)
      Scheduling::Topic.where(conference_id: track.conference_id, status: 'shortlisted').map do |topic|
        [ topic.title, topic.id ]
      end
    end
  end
end

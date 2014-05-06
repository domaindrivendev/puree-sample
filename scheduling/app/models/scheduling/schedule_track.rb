module Scheduling
  
  class ScheduleTrack < Command
    field :conference_id, :integer
    field :track_id, :integer
    field :track_name, :string

    attr_accessible :conference_id, :track_id, :track_name

    def self.for(track_id)
      track = Track.find(track_id)
      new(conference_id: track.conference_id, track_id: track.id, track_name: track.name)
    end
  end
  
end

# module Scheduling
#   class UpdateTrackSessions < Command
#     field :track_id, :integer
  
#     attr_accessible :track_id
  
#     def do_submit
#       track = track_repository.find_by(track_id)

#       sessions = session_infos.map do |info|


#       topic = topic_repository.find_by(topic_id)
#       start_time = Domain::TimeOfDay.new(start_time_mins, start_time_hours)
#       end_time = Domain::TimeOfDay.new(end_time_mins, end_time_hours)

#       track.add_session(topic, start_time, end_time)

#       track_repository.update(track)
#     end

#     def topics
#       track = Scheduling::Track.find(track_id)
#       Scheduling::Topic.where(conference_id: track.conference_id, status: 'shortlisted').map do |topic|
#         [ topic.title, topic.id ]
#       end
#     end
#   end

#   class CreateSession < ActiveRecord::Base
#     has_no_table

#     field :topic_id, :integer
#     field :start_time_hours, :integer
#     field :start_time_mins, :integer
#     field :end_time_hours, :integer
#     field :end_time_mins, :integer
  
#     attr_accessible :topic_id,
#                     :start_time_hours,
#                     :start_time_mins,
#                     :end_time_hours,
#                     :end_time_mins
#   end
# end

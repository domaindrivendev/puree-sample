module Scheduling
  
  class TrackCell < Cell::Rails

    def show(track_id)
      @schedule_track = ScheduleTrack.for(track_id)

      @request = parent_controller.request
      render
    end
  end

end
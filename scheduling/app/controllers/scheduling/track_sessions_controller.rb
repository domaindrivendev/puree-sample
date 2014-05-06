require_dependency "scheduling/application_controller"

module Scheduling
  class TrackSessionsController < ApplicationController

    def update
      @update_track_sessions = UpdateTrackSessions.for(params[:track_id])
      @update_track_sessions.attributes = params[:update_track_sessions]

      raise params.inspect
    end
  end
end

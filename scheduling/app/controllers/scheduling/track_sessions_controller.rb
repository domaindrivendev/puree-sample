require_dependency "scheduling/application_controller"

module Scheduling
  class TrackSessionsController < ApplicationController

    def new
      @create_session = CreateSession.new(track_id: params[:track_id])
    end

    def create
      @create_session = CreateSession.new(track_id: params[:track_id])
      @create_session.attributes = params[:create_session]

      if @create_session.submit
        track = Track.find(params[:track_id])
        return redirect_to conference_tracks_path(track.conference_id)
      end
  
      render :new
    end
  end
end

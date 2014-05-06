require_dependency "scheduling/application_controller"

module Scheduling
  class ConferenceTracksController < ApplicationController
  
    def index
      @view_model = ConferenceTracks.for(params[:conference_id])
    end
  
    def create
      @create_track = CreateTrack.for(params[:conference_id])
      @create_track.attributes = params[:create_track]

      if @create_track.submit
        return redirect_to conference_tracks_path(@create_track.conference_id)
      end
  
      render :new
    end
  end
end

require_dependency "scheduling/application_controller"

module Scheduling
  class ConferenceTracksController < ApplicationController
  
    def index
      @conference = Conference.find(params[:conference_id])
    end
  
    def new
      @create_track = CreateTrack.new(conference_id: params[:conference_id])
    end
  
    def create
      @create_track = CreateTrack.new(conference_id: params[:conference_id])
      @create_track.attributes = params[:create_track]

      if @create_track.submit
        return redirect_to conference_tracks_path(params[:conference_id])
      end
  
      render :new
    end
  end
end

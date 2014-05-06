require_dependency "planning/application_controller"

module Planning

  class ConferenceTracksController < ApplicationController
  
    def index
      @conference = Conference.find(params[:conference_id])
    end

    def new
      @new_track_form = NewTrackForm.for(params[:conference_id])
    end
  
    def create
      @new_track_form = NewTrackForm.for(params[:conference_id])
      @new_track_form.attributes = params[:new_track_form]

      if @new_track_form.submit
        return redirect_to conference_tracks_path(params[:conference_id])
      end
  
      render :new
    end
  end

end
require_dependency "planning/application_controller"

module Planning
  
  class ConferencesController < ApplicationController

    # GET /conferences  
    def index
      @conferences = Conference.all
    end
  
    # GET /conferences/new
    def new
      @new_conference_form = NewConferenceForm.new
    end
  
    # POST /conferences
    def create
      @new_conference_form = NewConferenceForm.new(params[:new_conference_form])
      if @new_conference_form.submit
        return redirect_to conferences_path
      end
  
      render :new
    end
  
    # GET /conferences/:id/edit
    def edit
      @conference = Conference.find(params[:id])
    end
  end
  
end

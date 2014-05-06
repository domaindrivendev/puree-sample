require_dependency "scheduling/application_controller"

module Scheduling
  class ConferencesController < ApplicationController
  
    def index
      @conference_views = ConferenceView.all
    end
  
    def new
      @conference_form = ConferenceForm.new
    end
  
    def create
      @conference_form = ConferenceForm.new(params[:conference_form])
      if @conference_form.submit
        return redirect_to conferences_path
      end
  
      render :new
    end
  
    def edit
      @conference_form = ConferenceForm.find(params[:id])
    end

    # def call_for_submissions
    #   call_for_submissions = CallForSubmissionsForm.new(conference_id: params[:conference_id])
    #   call_for_submissions.submit

    #   redirect_to conference_topics_path(call_for_submissions.conference_id)
    # end
  end
end
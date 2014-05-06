require_dependency "planning/application_controller"

module Planning

  class ConferenceSubmissionsController < ApplicationController
    
    def index
      @conference = Conference.find(params[:conference_id])
    end

    def shortlist
      @form = ShortlistSubmissionForm.for(params[:submission_id])
      @form.submit

      redirect_to conference_submissions_path(params[:conference_id])
    end

    def unshortlist
      @form = UnshortlistSubmissionForm.for(params[:submission_id])
      @form.submit

      redirect_to conference_submissions_path(params[:conference_id])
    end
  end

end
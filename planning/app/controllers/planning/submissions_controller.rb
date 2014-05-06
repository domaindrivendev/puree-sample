require_dependency "planning/application_controller"

module Planning
  
  class SubmissionsController < ApplicationController
  
    
    def index
      @submissions = Submission.all
    end
  
    def new
      @new_submission_form = NewSubmissionForm.new
    end
  
    def create
      @new_submission_form = NewSubmissionForm.new(params[:new_submission_form])
      if @new_submission_form.submit
        return redirect_to submissions_path
      end
  
      render :new
    end
  end
  
end

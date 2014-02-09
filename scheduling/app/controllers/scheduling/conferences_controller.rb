require_dependency "scheduling/application_controller"

module Scheduling
  class ConferencesController < ApplicationController
  
    def index
      @conferences = Conference.all
    end
  
    def new
      @create_conference = CreateConference.new
    end
  
    def create
      @create_conference = CreateConference.new(params[:create_conference])
      if @create_conference.submit
        return redirect_to conferences_path
      end
  
      render :new
    end
  
    def show
      @conference = Conference.find(params[:id])
    end

    def call_for_submissions
      call_for_submissions = CallForSubmissions.new(conference_id: params[:conference_id])
      call_for_submissions.submit

      redirect_to conference_topics_path(params[:conference_id])
    end
  end
end
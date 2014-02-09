require_dependency "scheduling/application_controller"

module Scheduling

  class ConferenceTopicsController < ApplicationController
  
    def index
      @conference = Conference.find(params[:conference_id])
    end
  end
end
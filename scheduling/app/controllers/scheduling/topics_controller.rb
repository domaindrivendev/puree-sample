require_dependency "scheduling/application_controller"

module Scheduling
  class TopicsController < ApplicationController
  
    def index
      @topics = Topic.all
    end

    def new
      @submit_topic = SubmitTopic.new
    end
  
    def create
      @submit_topic = SubmitTopic.new(params[:submit_topic])
      if @submit_topic.submit
        return redirect_to topics_path
      end
  
      render :new
    end

    def shortlist
      shortlist_topic = ShortlistTopic.for(params[:topic_id])
      shortlist_topic.submit

      redirect_to conference_topics_path(shortlist_topic.conference_id)
    end

    def unshortlist
      unshortlist_topic = UnshortlistTopic.for(params[:topic_id])
      unshortlist_topic.submit
      
      redirect_to conference_topics_path(unshortlist_topic.conference_id)
    end
  end
end

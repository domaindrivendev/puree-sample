require 'puree'
require 'puree-rails'
require_relative 'domain'

module Planning
  module Persistence

		def track_repository
		  @track_repository ||= Puree::Repository.for(
		    Domain::Track,
		    id_generator,
		    event_store,
		    event_dispatcher)
		end

		def submission_repository
		  @submission_repository ||= Puree::Repository.for(
		    Domain::Submission,
		    id_generator,
		    event_store,
		    event_dispatcher)
		end

		def conference_repository
		  @conference_repository ||= Puree::Repository.for(
		    Domain::Conference,
		    id_generator,
		    event_store,
		    event_dispatcher)
		end

    def id_generator
      @id_generator ||= PureeRails::ActiveRecordIdGenerator.instance
    end

    def event_store
      @event_store ||= PureeRails::ActiveRecordEventStore.instance
    end

    def event_dispatcher
      @event_dispatcher ||= Puree::EventDispatcher.instance
    end
  end
end

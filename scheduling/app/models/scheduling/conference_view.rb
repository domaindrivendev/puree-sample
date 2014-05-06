module Scheduling
  
  class ConferenceView < ActiveRecord::Base
    attr_accessible :id,
                    :name,
                    :description,
                    :date,
                    :location,
                    :status
    # def accepting_submissions?
    #   self.status == 'accepting_submissions'
    # end

    # def pending_topics
    #   topics.where('status != ?', 'shortlisted')
    # end

    # def shortlisted_topics
    #   topics.where(status: 'shortlisted')
    # end
  end
end

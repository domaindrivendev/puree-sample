module Scheduling
  class Conference < ActiveRecord::Base
    attr_accessible :id,
                    :name,
                    :description,
                    :date,
                    :location,
                    :status
                    
    has_many :topics
    has_many :tracks

    def accepting_submissions?
      self.status == 'accepting_submissions'
    end

    def submitted_topics
      topics.where('status != ?', 'shortlisted')
    end

    def shortlisted_topics
      topics.where(status: 'shortlisted')
    end
  end
end

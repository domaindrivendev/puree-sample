module Planning

  class Conference < ActiveRecord::Base
    attr_accessible :id, :name, :description, :date, :location, :status

    has_many :submissions
    has_many :tracks

    def pending_submissions
      self.submissions.where(status: 'pending')
    end

    def shortlisted_submissions
      self.submissions.where(status: 'shortlisted')
    end
  end

end
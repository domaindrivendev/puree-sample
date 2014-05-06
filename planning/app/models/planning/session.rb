module Planning
  class Session < ActiveRecord::Base
    attr_accessible :start_hour, :start_min, :end_hour, :end_min, :submission_id, :submission_title
  end
end

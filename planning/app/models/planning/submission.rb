module Planning
  class Submission < ActiveRecord::Base
    attr_accessible :id, :title, :overview, :status, :conference_id

    belongs_to :conference
  end
end

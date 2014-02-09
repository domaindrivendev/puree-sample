module Scheduling
  class Topic < ActiveRecord::Base
    attr_accessible :id,
                    :title,
                    :overview,
                    :status,
                    :conference_id
  end
end

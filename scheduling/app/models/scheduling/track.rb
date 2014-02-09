module Scheduling
  class Track < ActiveRecord::Base
    attr_accessible :id, :name, :conference_id

    has_many :sessions
  end
end

module Scheduling
  class Session < ActiveRecord::Base
    attr_accessible :id, :time_slot, :title
  end
end

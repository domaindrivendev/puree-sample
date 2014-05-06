require 'scheduling/domain'
require 'scheduling/persistence'

module Scheduling

  class PersistentForm < ActiveRecord::Base
    include Domain
    include Persistence

    self.abstract_class = true
    
    def submit
      return false if invalid?
      on_submit
      return true
    end
  end
end
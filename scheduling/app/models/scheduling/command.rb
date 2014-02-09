require 'scheduling/domain'
require 'scheduling/persistence'

module Scheduling

  class Command < ActiveRecord::Base
    has_no_table

    def self.field(name, sql_type)
      column(name, sql_type)
    end
    
    include Domain
    include Persistence
    
    def submit
      return false if invalid?
      do_submit
      return true
    end
  end
end

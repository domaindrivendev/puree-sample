require 'planning/domain'
require 'planning/persistence'

module Planning

  class TransientForm < ActiveRecord::Base
    has_no_table

    def self.field(name, sql_type)
      column(name, sql_type)
    end
    
    include Domain
    include Persistence
    
    def submit
      return false if invalid?
      
      ActiveRecord::Base.transaction do
        on_submit
      end
      
      true
    end
  end
  
end

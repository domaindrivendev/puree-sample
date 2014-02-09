require 'scheduling/domain'

include Puree
include Scheduling::Domain

module ExceptionHelpers 

  def attempt(&block)
    begin
      block.call
    rescue => ex
      @exception = ex
    end
  end
end

World(ExceptionHelpers)
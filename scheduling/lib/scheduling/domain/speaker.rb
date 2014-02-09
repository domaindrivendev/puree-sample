require 'puree'

module Scheduling
  module Domain
  
    class Speaker
      attr_reader :user_id, :name
  
      def initialize(user_id, name)
        raise ArgumentError.new('user_id required') if user_id.nil?
        raise ArgumentError.new('name required') if name.nil?
  
        @user_id = user_id
        @name = name
      end
  
      def ==(other)
        self.class == other.class &&
        @user_id == other.user_id &&
        @name == other.name
      end
      
      alias :eql? :==
  
      def hash
        [@user_id, @name].hash
      end
    end
  
  end
end

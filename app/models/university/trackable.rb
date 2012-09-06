require 'carrierwave/mongoid'
Stateflow.persistence = :mongoid

module University
  module Trackable
    def self.included(base)
      base.send :include, Stateflow
      
      base.instance_eval do
        field :state, :type => String                  
        
        stateflow do
          initial :issued
          state :issued, :verified, :approved, :finalized
          
          event :verify do
            transitions  from: :issued, to: :verified
          end  
          
          event :approve do
            transitions  from: :verified, to: :approved
            transitions  from: :finalized, to: :approved  
          end
          
          event :reject do
            transitions  from: :verified, to: :finalized  
          end          
          
        end
      end
    end
  end
end
module University

  class Solution
    include Mongoid::Document
    include Trackable 
    
    embedded_in :tasks, class_name: "University::Task"
    
    field :date, type: Date, default: ->{ Time.now }
    field :code, type: String    
    field :review, type: String
  end
    
end

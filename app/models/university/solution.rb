module University

  class Solution
    include Mongoid::Document
    #include Mongoid::Versioning    
    include Mongoid::Timestamps::Created
    include Trackable
    
    embedded_in :task, class_name: "University::Task", inverse_of: :solutions
       
    field :code, type: String    
    field :review, type: String
  end
    
end

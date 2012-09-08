module University
  
  class Task
    include Mongoid::Document
    include Trackable
    
    embedded_in :student, class_name: "University::Student", inverse_of: :tasks
    
    has_many :solutions, class_name: "University::Solution"
    has_many :reports, class_name: "University::Report"
    
    belongs_to :variant, class_name: "Manual::Variant"
    
    
  
        
  end
  
end

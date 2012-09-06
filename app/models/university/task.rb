module University
  
  class Task
    include Mongoid::Document
    include Trackable
    
    embedded_in :student, class_name: "University::Student"
    
    embeds_many :solutions, class_name: "University::Solution"
    embeds_many :reports, class_name: "University::Report"
    
  end
  
end
